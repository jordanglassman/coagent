class ProjectsController < ApplicationController
	
	before_filter :require_user
	before_filter :set_taken_priorities, :get_next_priority
	before_filter :render_report, only: 'sent'
	
	def set_taken_priorities
		@taken = Project.select(:priority).order(:priority)
	end
	
	def get_next_priority
		@next_priority = Project.find_all_by_phase('To be delivered').count + 1
	end

	def render_report
    @projects_tbd = Project.find_all_by_phase('To be delivered', order: :priority)
    @projects_os = Project.find_all_by_phase('Ongoing support', order: :priority)

    @start_date = Time.now.beginning_of_week.strftime("%m/%d/%Y")
    @one_week_later = (Time.now.beginning_of_week + 1.week).strftime("%m/%d/%Y")
    
		#for some reason, this will not render to file
		# todo
	  #render template: 'projects/report.pdf.prawn', layout: false
  end
	
  # GET /projects
  # GET /projects.json
  def index
    @projects_to_be_delivered = Project.find_all_by_phase('To be delivered', order: :priority)
    @projects_ongoing_support = Project.find_all_by_phase('Ongoing support')
    @start_date = Time.now.beginning_of_week.strftime("%m/%d/%Y")
    @one_week_later = (Time.now.beginning_of_week + 1.week).strftime("%m/%d/%Y")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.pdf
    end
  end

  # GET /projects/report
  def report
  	
    @projects_tbd = Project.find_all_by_phase('To be delivered', order: :priority)
    @projects_os = Project.find_all_by_phase('Ongoing support', order: :priority)

    @start_date = Time.now.beginning_of_week.strftime("%m/%d/%Y")
    @start_date_file = Time.now.beginning_of_week.strftime("%Y-%m-%d")
    @one_week_later = (Time.now.beginning_of_week + 1.week).strftime("%m/%d/%Y")
    
    respond_to do |format|
      format.pdf
    end
  end

    # GET /projects/reports
  def reports
  	
    @all_reports = Dir.glob("public/reports/weekly_status*.pdf")
    @all_reports.map! { |f| f.sub!('public/','../') }
    respond_to do |format|
      format.html
    end
  end
  
  # GET /projects/send_reports
  def send_reports
  	
    @mg_users = Group.joins(:users).select('users.id, users.name, users.email').where('groups.name = ?','Management Group')
    
    respond_to do |format|
      format.html
    end
  end

  # PUT /projects/sent
  def sent

    @mg_users = params[:mg]
    @mg_users.each do |email, send_flag|
    	if send_flag.to_i==1
      	DistributeReports.weekly_mg_report(email).deliver
      end
    end
    respond_to do |format|
      format.html
    end
  end
  
  # GET /projects/list
  def list
  	
    # defined in application_controller.rb
    get_projects_by_group

    respond_to do |format|
      format.html # list.html.erb
    end
  end  

  
  # GET /projects/top
  def top
    @projects = Project.find(:all, order: :priority, limit: 5)

    respond_to do |format|
      format.html # list.html.erb
    end
  end  
  
  # GET /projects/1
  # GET /projects/1.json
  def show
    begin
      @project = Project.find(params[:id])
      @percent_done = 100*((Date.today - @project.created_at.to_date).to_f/(@project.due_date - @project.created_at.to_date).to_f)
      if @percent_done < 0 
        @percent_done = 100
      end
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid project #{params[:id]}"
      redirect_to projects_url, notice: "Invalid project #{params[:id]} entered in URL"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @project }
      end
    end
  end

  
  
  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])

  end

  # POST /projects
  # POST /projects.json
  def create
  	
  	# declared to keep in method scope
  	project_verb = 'dummy'
  	
  	# add check to see if only priority is being changed
  	# project verb is for return flash in redirect below
  	if params.has_key?(:new_priority)
  		Project.transaction do
				params[:new_priority].each do |p|
					unless p[1].blank?
						@project = Project.find(p[0])
						@project.update_attributes(priority: p[1])
						@project.save(validate: false)
						project_verb = "updated"
					end
				end
				@projects = Project.all
				if !@projects.all? { |p| if p.priority != 0 then p.valid? else true end }
					raise 'Re-prioritized project failed uniqueness validation check'
					project_verb=''
				end
			end
  	else
    	@project = Project.new(params[:project])
  		project_verb = "created"
			# don't remember what this is for...
			if params[:project][:phase] == 'Ongoing support' 
				Project.ongoing_support = true
			else
				Project.ongoing_support = false
			end  		
    end
    logger.debug "project_verb=#{project_verb}"
    respond_to do |format|
      if @project.save and project_verb == 'created'
        format.html { redirect_to @project, notice: "Project was successfully #{project_verb}." }
        format.json { render json: @project, status: :created, location: @project }
      	AssignmentNotifier.assigned(@project,'TL').deliver unless @project.technical_lead == 'TBD'
      	AssignmentNotifier.assigned(@project,'PM').deliver unless @project.project_manager == 'TBD'
      elsif project_verb == 'updated'
      	format.html { redirect_to projects_path, notice: "Project was successfully #{project_verb}." }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    if params[:project][:phase] == 'Ongoing support' 
    	Project.ongoing_support = true
    else
    	Project.ongoing_support = false
    end
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
end
