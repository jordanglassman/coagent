class Task < ActiveRecord::Base
  belongs_to :projects
  
  validates :project_id, :name, :due_date, :severity, 
  	:status, :resource, :deliverable, presence: true
  	
  	
end
