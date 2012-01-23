require 'email_validator'
require 'internal_users'

class User < ActiveRecord::Base
		has_secure_password
		
		cattr_accessor :internal_id

		has_and_belongs_to_many :groups, uniq: true
		
		validates :username, :name, :email, presence: true
		
		# this validation is contained in activemodel::securepassword
		#validates :password_digest, presence: true
		 
		validates :username, length: {minimum: 1, maximum: 254}, uniqueness: true
		validates :name, length: {minimum: 1, maximum: 254}
		
		# removed for AD authentication
		#validates :password_digest, length: {minimum: 1, maximum: 254}		
		
		# email validation defined in lib/email_validator.rb
		validates :email, length: {minimum: 3, maximum: 254},
			uniqueness: true,
			email: true
		
		# convert numerical ids from drop down menus in Users new view to people in the DB
		before_validation :convert_internal_ids_to_names 
					
		def convert_internal_ids_to_names
			internal_user = InternalUsers.find(internal_id)
			self.name = internal_user.name
			self.email = internal_user.email
			self.username = internal_user.username
		end
			
		# get group name for display on users model since group_id is an integer 1-4 						
		def get_group(gid)
			@group_name=GROUPS[gid.to_s]
		end
		
		def name_for_form
			"#{name}"
		end
	


end
