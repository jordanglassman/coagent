class AccountController < ApplicationController
  def settings
  end

  def home
   
    @min_date = @current_time.localtime-1.week
      
    @announcements = Announcement.find :all, order: 'updated_at desc', 
    conditions: ["updated_at between \'#{@min_date}\' and \'#{@current_time.to_datetime.utc}\'"]
    
    # these are for home use only and need to be updated to reflect that user only 
    @projects = Project.order(:priority)
    
    respond_to do |format|
      format.html # list.html.erb
    end
  	
  end

end
