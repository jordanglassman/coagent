class AccountController < ApplicationController
  def settings
  	@user = User.find(session[:user_id])
  end

  def home
   
    @min_date = @current_time.localtime-1.week
      
    @announcements = Announcement.find :all, order: 'updated_at desc', 
    conditions: ["updated_at between \'#{@min_date}\' and \'#{@current_time.to_datetime.utc}\'"]

    # defined in application_controller.rb
    get_projects_by_group

    respond_to do |format|
      format.html # list.html.erb
    end
  	
  end

end
