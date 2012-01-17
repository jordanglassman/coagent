class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validates :priority, uniqueness: true
  
  after_create :create_default_tasks
  before_create :update_status_last_updated
  before_destroy :ensure_not_referenced_by_any_tasks
  
  # get user name for TL/PM by UID 						
	def get_user(uid)
		if User.exists?(uid)
			@user_name=User.find(uid).name
		else
			@user_name='Unknown TL/PM UID'
		end
	end

    
	def list_first_10_available_priorities(taken)
			unused = Array.new(10)
			taken_array = taken.map(&:priority)
			j=1
			i=0
			while i<10
  			taken_array.each do |k|
    			if j==k
      			j+=1
    			end
   			end
   			unused[i]=j
   			i+=1
   			j+=1
			end
			unused.to_sentence
		end
	
	private
	
		def ensure_not_referenced_by_any_tasks
			if tasks.empty?
				true
			else
				#errors.add(:base, 'Cannot destroy, tasks still present')
				#return false
				# need to add code to verify or destory some/all tasks
				true
			end
		end
		
		def create_default_tasks
   	  tasks.create(name: 'Initial planning meeting', 
   	  	description: 'TL/PM and all projected key resources meet to discuss major milestones and rough timeline',
   	  	due_date: Time.now + 1.week,
   	  	severity: 3,
   	  	status: 1,
   	  	resource: "#{self.project_manager} & #{self.technical_lead}",
   	  	deliverable: 'Informal timeline containing major milestones and list of additional resources required'
    	)

    	tasks.create(name: 'Assessment of required development', 
    		description: 'TL conducts an assessment of all required development',
    		due_date: Time.now + 1.week,
    		severity: 3,
    		status: 1,
    		resource: "#{self.technical_lead}",
    		deliverable: 'Outline of projected development, including required timeline and dependency tree'
    		)    

    	tasks.create(name: 'Go-live', 
    		description: 'Project transitions from development to production',
    		due_date: self.due_date,
    		severity: 3,
    		status: 1,
    		resource: "#{self.project_manager} & #{self.technical_lead}",
    		deliverable: 'Production system and customer sign-off'
    		)
    end
    
    def update_status_last_updated
    	self.status_last_updated = Time.now
    end


end
