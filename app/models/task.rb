class Task < ActiveRecord::Base
  belongs_to :projects
  
  validates :project_id, :name, :due_date, :severity, 
  	:status, :resource, :deliverable, presence: true

 	validates :id, uniqueness: true  

 	validates :severity, inclusion: { in: 1..3, message: "ID must be one of 1, 2, or 3" }

 	validates :status, inclusion: { in: 1..5, message: "ID must be an integer in 1 through 5" }
 	
  validate :validate_due_date
  def validate_due_date
  	if !due_date.blank?
  		errors.add("Due date","is not later than today's date.")  unless due_date > Date.today
  	end
  end

  private
  def self.attributes_protected_by_default
  end
  
end
