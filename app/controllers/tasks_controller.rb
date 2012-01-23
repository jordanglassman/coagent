class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    
    Task.update_all(["priority_task_flag=?",true], id: params[:task_ids])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # PUT /tasks/index_updates
  def index_update

    Task.all.each do |t|
    	if !params[:task_ids].nil?
    		if params[:task_ids].include? t.id.to_s
    			t.update_attribute(:priority_task_flag, true)
    		else
    			t.update_attribute(:priority_task_flag, false)
    		end
    	end
    end

    @tasks = Task.all    

    respond_to do |format|
      format.html # index.html.erb 
    end
  end  
  
  # GET /tasks/list
  def list
  	
  	# define in application_controller.rb
    get_tasks_by_group_or_name

    respond_to do |format|
      format.html # list.html.erb
    end
  end  

  
  # GET /tasks/top
  def top
    @tasks = Task.all

    respond_to do |format|
      format.html # list.html.erb
    end
  end   
  
  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new(project_id: params[:project_id])
		@next_available_id = Task.maximum(:id) + 1
		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    
    # terrible hack, does not actually get next available id
    @next_available_id = params[:id]
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

		@project = Project.find(@task.project_id)
		@next_available_id = Task.maximum(:id) + 1
		
		@project.tasks.build
		
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
