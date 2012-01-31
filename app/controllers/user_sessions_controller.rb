class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    #reset_session
  end

  def create

  	user = User.find_by_username(params[:username])

  	# temporary backdoor for testing
  	if user and !InternalUsers.find_by_username(params[:username]) 
  		session[:user_id] = user.id
  		session[:group_id] = user.groups.map &:id
      @user_session = UserSession.new
      @user_session.credentials = { username: params[:username], password: params[:password], remember_me: true }
      # use different pw validation scheme for 'local' users
  		UserSession.verify_password_method = :valid_password?
  		if @user_session.save
  		  flash[:notice] = 'Non-LDAP (local) login successful!'
  		  redirect_to account_home_url
  		else
  		  redirect_to login_url, alert: 'Invalid username/password combination (or perhaps an LDAP issue)'
  		end
  	elsif user
      @ldap = Net::LDAP.new(
       :host => 'domctl01', 
       :port => 389, 
       :auth => { method: :simple, username: 'internal\\'+params[:username], password: params[:password] } )
      if @ldap.bind
        session[:user_id] = user.id
  		  session[:group_id] = user.groups.map &:id
  		  @user_session = UserSession.new(username: params[:username], password: params[:password], remember_me: true)
  		  if @user_session.save
  		    flash[:notice] = 'LDAP login successful!'
  		    redirect_to account_home_url
  		  else
  		    redirect_to login_url, alert: 'LDAP login successful but session creation failed, please contact administrator'
  		  end  		  
  		else
  			redirect_to login_url, alert: 'Invalid LDAP username/password combination (or perhaps some other LDAP issue)'
  		end
  	else
  		redirect_to login_url, alert: 'Invalid username'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	session[:group_id] = nil
  	UserSession.find.destroy
  	redirect_to login_url, notice: 'Successfully logged out'
  end

end
