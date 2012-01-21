class Task < ActiveRecord::Base
  belongs_to :projects
  
  validates :project_id, :name, :due_date, :severity, 
  	:status, :resource, :deliverable, presence: true

 	validates :id, uniqueness: true  
  	
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
