class AccountController < ApplicationController
  def settings
  end

  def home
   
    @min_date = @current_time.localtime-1.week
      
    @announcements = Announcement.find :all, order: 'updated_at desc', 
    conditions: ["updated_at between \'#{@min_date}\' and \'#{@current_time.to_datetime.utc}\'"]
    
    case session[:group_id]
		when 'Super Users', 'Management Group'
    	@projects = Project.order(:priority)    	
		when 'Project Managers' 
    	@projects = Project.find_by_project_manager(session[:user_id], order: :priority)
   	when 'Technical Leads'
  		@projects = Project.find_by_technical_lead(session[:user_id], order: :priority)
  	end    
    
    respond_to do |format|
      format.html # list.html.erb
    end
  	
  end

end
