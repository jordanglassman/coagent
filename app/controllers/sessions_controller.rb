class SessionsController < ApplicationController
	
	skip_before_filter :authorize 
	
  def new
  end

  def create
  	user = User.find_by_name(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:group_id] = user.groups[0].name
  		logger.info session[:group_id]   
  		redirect_to account_home_url
  	else
  		redirect_to login_url, alert: 'Invalid username/password combination'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: 'Successfully logged out'
  end

end
