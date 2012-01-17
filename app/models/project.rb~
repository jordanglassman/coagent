class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  
  before_destroy :ensure_not_referenced_by_any_tasks
  
  # get user name for TL/PM by UID 						
	def get_user(uid)
		@user_name=User.find_by_uid(uid).name
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
end
