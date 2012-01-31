class GroupsController < ApplicationController
	
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
  
  private
  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end
