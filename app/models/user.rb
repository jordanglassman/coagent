require 'email_validator'
require 'internal_users'

class User < ActiveRecord::Base

	cattr_accessor :internal_id  
  
	  #using authlogic for authentication now
    #has_secure_password
    
    #activate audit trail for all CRUD ops in model user
     acts_as_audited :except => [
       :persistence_token,
       :perishable_token,
       :login_count,
       :failed_login_count,
       :last_request_at,
       :current_login_at,
       :last_login_at,
       :current_login_ip,
       :last_login_ip
       ], with_associations: :groups
		
		acts_as_authentic do |c|
		  c.crypto_provider = Authlogic::CryptoProviders::BCrypt
		  c.login_field = :username 
		  #c.validate_password_field = false
		  #c.crypted_password_field = false
		  c.require_password_confirmation = true
      c.ignore_blank_passwords = true
		end
		
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
		  logger.info "internal_id: #{internal_id}"
			if internal_id.nil?
			  logger.info 'internal_id was nil'
			  # placefiller until alternate user create added
			  return
			else
			  internal_user = InternalUsers.find(internal_id) 
			  self.name = internal_user.name
			  self.email = internal_user.email
			  self.username = internal_user.username
			  logger.info "email: #{self.email}"
			end
		end
			
		# get group name for display on users model since group_id is an integer 1-4 						
		def get_group(gid)
			@group_name=GROUPS[gid.to_s]
		end
		
		def name_for_form
			"#{name}"
		end
	
		def username_select
		  InternalUsers.find_by_username(:username)
		end
		
		def username_select=(username)
	    set = InternalUsers.find_or_create_by_username(:username) if username.present?
	    set.username = username
	  end

	  def name_select
		  InternalUsers.find_by_name(:name)
		end
		
		def name_select=(name)
	    set = InternalUsers.find_or_create_by_name(:name) if name.present?
	    set.name = name
	  end
	  
		def email_select
		  InternalUsers.find_by_email(:email)
		end
		
		def email_select=(email)
	    set = InternalUsers.find_or_create_by_email(:email) if email.present?
	    set.email = email
	  end

	  def valid_ldap_password(password)
	  	true
	  end

end
