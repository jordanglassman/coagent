class PanopticController < ApplicationController
	
  before_filter :require_user
  
	def view
	  @audit_users = Audit.page(params[:page]).find_all_by_auditable_type('User', order: "created_at desc")
	  @audit_groups = Audit.page(params[:page]).find_all_by_auditable_type('Group', order: "created_at desc")
	  @audit_projects = Audit.page(params[:page]).find_all_by_auditable_type('Project', order: "created_at desc")
	  @audit_tasks = Audit.page(params[:page]).find_all_by_auditable_type('Task', order: "created_at desc")
  end

end
