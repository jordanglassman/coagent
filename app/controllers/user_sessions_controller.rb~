class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    reset_session
  end

  def create

  	user = User.find_by_username(params[:username])

  	# temporary backdoor for testing
  	if user and user.name == 'admin' #and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:group_id] = user.groups.map &:id
  		
#  		@user_session = UserSession.new(username: params[:username].to_s, password: params[:password].to_s)
@user_session = UserSession.new(username: 'admin', password: 'password', remember_me: true)
      #user.reset_persistence_token!
  		if @user_session.save
  		  logger.debug "username: #{@user_session.record.inspect}"
  		  flash[:notice] = 'Login successful!  Using admin backdoor for testing (bypassing AD authentication)'
  		  redirect_to account_home_url
  		else
  		  redirect_to login_url, alert: 'Invalid username/password combination (or perhaps an LDAP issue)'
  		end
  	elsif user
      ldap = Net::LDAP.new(
      	:host => 'domctl01', 
      	:port => 389, 
      	:auth => { method: :simple, username: 'internal\\'+params[:username], password: params[:password] } )
      if ldap.bind
        session[:user_id] = user.id
  		  session[:group_id] = user.groups.map &:id
  		  redirect_to account_home_url
  		else
  			redirect_to login_url, alert: 'Invalid username/password combination (or perhaps an LDAP issue)'
  		end
  	else
  		redirect_to login_url, notice: 'Invalid username/password combination (or perhaps an LDAP issue)'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	session[:group_id] = nil
  	UserSession.find.destroy
  	redirect_to login_url, notice: 'Successfully logged out'
  end

end
