class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(:priority)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
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
    @taken = Project.select(:priority).order(:priority).limit(10)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @taken = Project.select(:priority).order(:priority).limit(10)
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @taken = Project.select(:priority).order(:priority).limit(10)
 
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
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
