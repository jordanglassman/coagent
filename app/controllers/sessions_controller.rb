class SessionsController < ApplicationController
	
	skip_before_filter :authorize 

  def new
  end

  def create

  	user = User.find_by_username(params[:username])

  	# temporary backdoor for testing
  	if user and user.name == 'admin' and user.authenticate(params[:password])
  		session[:user_id] = user.id
  	  session[:group_id] = user.groups[0].name
  		redirect_to account_home_url, notice: 'Using admin backdoor for testing (bypassing AD authentication)'
  	elsif user
      ldap = Net::LDAP.new(
      	:host => 'domctl01', 
      	:port => 389, 
      	:auth => { method: :simple, username: 'internal\\'+params[:username], password: params[:password] } )
      if ldap.bind
      	logger.info "Here: #{ldap}"
        session[:user_id] = user.id
  		  session[:group_id] = user.groups[0].name
  		  redirect_to account_home_url
  		else
  			redirect_to login_url, alert: 'Invalid username/password combination (or perhaps an LDAP issue)'
  		end
  	else
  		redirect_to login_url, alert: 'Invalid username/password combination (or perhaps an LDAP issue)'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: 'Successfully logged out'
  end

end
