class ProjectsController < ApplicationController
	
	before_filter :set_taken_priorities
	
	def set_taken_priorities
		@taken = Project.select(:priority).order(:priority)
	end
	
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(:priority)
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
    @one_week_later = (Time.now.beginning_of_week + 1.week).strftime("%m/%d/%Y")
    
    respond_to do |format|
      format.pdf
    end
  end
  
  # GET /projects/list
  def list
    @projects = Project.order(:priority)

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
    @project = Project.new(params[:project])
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      	AssignmentNotifier.assigned(@project,'TL').deliver unless @project.technical_lead == 'TBD'
      	AssignmentNotifier.assigned(@project,'PM').deliver unless @project.project_manager == 'TBD'
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
