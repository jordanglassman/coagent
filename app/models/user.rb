require 'email_validator'

class User < ActiveRecord::Base
		has_secure_password

	
		has_and_belongs_to_many :groups, uniq: true
		
		validates :username, :name, :email, :password_digest, presence: true
		
		validates :username, length: {minimum: 1, maximum: 254}
		validates :name, length: {minimum: 1, maximum: 254}
		validates :password_digest, length: {minimum: 1, maximum: 254}		
		
		# email validation defined in lib/email_validator.rb
		validates :email, length: {minimum: 3, maximum: 254},
			uniqueness: true,
			email: true
			
			after_create :add_to_group
			
			def add_to_group
				#self.groups.create gid: self.group_id
			end
			
	# get group name for display on users model since group_id is an integer 1-4 						
	def get_group(gid)
		@group_name=GROUPS[gid.to_s]
	end
	
	def name_for_form
		"#{name}"
	end
	


end
