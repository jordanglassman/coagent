class GroupsController < ApplicationController
	
	before_filter :require_user
	helper_method :sort_column, :sort_direction
	
  # GET /groups
  def index
    @groups = Group.order(:id)
    
    respond_to do |format|                            
      format.html # index.html.erb
    end
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])
    @users = @group.users
    
    respond_to do |format|                            
      format.html # show.html.erb
    end
  end
  
	# PUT /groups/1
  def update
  	
  	# get list of all members of the group, subtract from the submitted list 
  	# then, for each UID delete this group from their group lists
    @group_members = Group.find(params[:id]).users.map &:id
    difference = @group_members - (params[:user_ids].map(&:to_i))
    #logger.debug "diff: #{difference}"
    difference.each do |d|
    	User.find(d).groups.delete(Group.find(params[:id]))
    end
    
    unless params[:user][:name].blank?
    	User.find(params[:user][:name]).groups<<(Group.find(params[:id]))
    end
    
    redirect_to group_path(params[:id])

  end
  
  private
  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end
