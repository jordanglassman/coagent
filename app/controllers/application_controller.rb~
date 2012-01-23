class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_var
  before_filter :authorize
  
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
