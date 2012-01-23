class UsersController < ApplicationController
	
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
  	
    @user = User.new(params[:user])
 		User.internal_id = params[:user][:name]

    respond_to do |format|
      if @user.save
				logger.info "email: #{@user.email}"
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    users_audit_log_file = File.open("#{Rails.root}/log/users.log",'a')
    users_audit_log = AuditLogger.new(users_audit_log_file)

    respond_to do |format|
    	status,changed = @user.update_attributes_changed(params[:user])
      if status
      	users_audit_log.info "superuser #{User.find(session[:user_id]).username} made changes to #{@user.username}: #{changed}"
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
