class PanopticController < ApplicationController
	
  before_filter :require_user
  
	def view
  	@users = User.all
  	@groups = Group.all
  end

end
