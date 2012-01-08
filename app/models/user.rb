class User < ActiveRecord::Base
		has_and_belongs_to_many :groups, uniq: true
			
	def get_group(group_id)
		@group_name=Group.find(group_id).name
	end
	
end
