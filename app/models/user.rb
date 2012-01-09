require 'email_validator'

class User < ActiveRecord::Base
		has_and_belongs_to_many :groups, uniq: true
		
		validates :username, :name, :group_id, :email, :password_digest, presence: true
		
		validates :username, length: {minimum: 1, maximum: 254}
		validates :name, length: {minimum: 1, maximum: 254}
		validates :password_digest, length: {minimum: 1, maximum: 254}		
		
		validates :group_id, numericality: { only_integer: true },
		  inclusion: {in: 1..4}
		
		# email validation defined in lib/email_validator.rb
		validates :email, length: {minimum: 3, maximum: 254},
			uniqueness: true,
			email: true
			
	# get group name for display on users model since group_id is an integer 1-4 						
	def get_group(gid)
		@group_name=Group.find_by_gid(gid).name
	end
			
end
