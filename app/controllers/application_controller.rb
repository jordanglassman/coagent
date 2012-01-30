class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user
  
  before_filter :set_var
  before_filter :require_user
  
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

  def get_projects_by_uid_and_groups(user_id, group_ids)
    @projects = []
  	if group_ids.include? 3
  	  @projects = Project.find_all_by_project_manager(user_id, order: :priority)
  	end
  	if group_ids.include? 4
  	  @projects |= Project.find_all_by_technical_lead(user_id, order: :priority)
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
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    #User.find(2).reset_persistence_token!
    @current_user_session = UserSession.find
   # @current_user_session.unauthorized_record.reset_persistence_token!

  end

  def current_user
    return @current_user if defined?(@current_user)
    #logger.debug "no current session: #{current_user_session.inspect }"
    #logger.debug "no current session: #{current_user_session.record.inspect }"
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      store_location
      logger.debug "no current session: #{@current_user.inspect}"
      flash[:notice] = "You must be logged in to access this page"
      #redirect_to login_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to login_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
