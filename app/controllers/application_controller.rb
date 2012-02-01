class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user
  
  before_filter :set_var
  before_filter :require_user
  
  WillPaginate.per_page = 10
  
  # get a list of projects depending on which group you're in
  # SU/MG get all, and TL/PM get TL, PM, or TL+PM
  def get_projects_by_group
    session[:group_id].each do |group_id|
			case Group.find(group_id).name
			when 'Super Users', 'Management Group'
				@projects = Project.in_priority_order.except_ongoing_support
				break
			when 'Project Managers' 
				projects = Project.get_projects_by_pm(session[:user_id]).in_priority_order
				@projects = @projects.blank? ? projects : @projects.merge(projects)
			when 'Technical Leads'
				projects = Project.get_projects_by_tl(session[:user_id]).in_priority_order
				@projects = @projects.blank? ? projects : @projects.merge(projects)
			end
		end
	end
	
  def get_projects_by_uid_and_groups(user_id, group_ids)
    @projects = []
  	if group_ids.include? 3
  	  @projects = Project.get_projects_by_pm(user_id).in_priority_order
  	end
  	if group_ids.include? 4
  	  @projects |= Project.get_projects_by_tl(user_id).in_priority_order
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
				projects = Project.Project.get_projects_by_pm(session[:user_id]).in_priority_order | Project.Project.get_projects_by_tl(session[:user_id]).in_priority_order
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
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = (current_user_session && current_user_session.record) ? current_user_session.record.username : false
  end
  
  def require_user
    unless current_user
      store_location
      logger.debug "no current session: #{@current_user.inspect}"
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
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
