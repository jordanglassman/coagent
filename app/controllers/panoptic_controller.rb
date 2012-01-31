class PanopticController < ApplicationController
	
  before_filter :require_user
  
	def view
	  @audit_users = Audit.find_all_by_auditable_type('User')
	  @audit_groups = Audit.find_all_by_auditable_type('Group')
	  @audit_projects = Audit.find_all_by_auditable_type('Project')
	  @audit_tasks = Audit.find_all_by_auditable_type('Task')	  
  end

end
