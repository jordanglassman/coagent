require 'email_validator'

class User < ActiveRecord::Base
		has_and_belongs_to_many :groups, uniq: true
		
		validates :username, :name, :group_id, :email, :password_digest, presence: true
		
		validates :username, length: {minimum: 1, maximum: 254}
		validates :name, length: {minimum: 1, maximum: 254}
		validates :password_digest, length: {minimum: 1, maximum: 254}		
		
		validates :group_id, numericality: true,
		inclusion: {in: 1..4}
		
		validates :email, length: {minimum: 3, maximum: 254},
			uniqueness: true,
			email: true
			

						
	def get_group(group_id)
		@group_name=Group.find(group_id).name
	end
	
end
