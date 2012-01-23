class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_var
  before_filter :authorize
  
  # get a list of projects depending on which group you're in
  # SU/MG get all, and TL/PM get TL, PM, or TL+PM
  def get_projects_by_group
    session[:group_id].each do |group_id|
			case Group.find(group_id).name
			when 'Super Users', 'Management Group'
				@projects = Project.order(:priority)
				break
			when 'Project Managers' 
				if @projects
					@projects |= Project.find_all_by_project_manager(session[:user_id], order: :priority)
				else
					@projects = Project.find_all_by_project_manager(session[:user_id], order: :priority)
				end
			when 'Technical Leads'
				if @projects
					@projects |= Project.find_all_by_technical_lead(session[:user_id], order: :priority)
				else
					@projects = Project.find_all_by_technical_lead(session[:user_id], order: :priority)
				end
			end
		end
	end

  # get a list of tasls depending on which group you're in
  # SU/MG get all, and TL/PM the tasks from the project's they're associated with
  def get_tasks_by_group_or_name
    session[:group_id].each do |group_id|
			case Group.find(group_id).name
			when 'Super Users', 'Management Group'
				@tasks = Task.order(:due_date)
				break
			else
				projects = Project.find_all_by_project_manager(session[:user_id], order: :priority) | Project.find_all_by_technical_lead(session[:user_id], order: :priority)
				@tasks = []
				projects.each { |p| @tasks += p.tasks }
				@tasks.sort! { |a,b| a.due_date <=> b.due_date }
			end
		end
	end
  
  private
  
  def set_var
  	@current_time = Time.now
  	@action_name=params[:action]
  end
  
  def authorize
  	unless User.find_by_id(session[:user_id])
  		redirect_to login_url, notice: 'Please log in'
  	end
  end
  
end
