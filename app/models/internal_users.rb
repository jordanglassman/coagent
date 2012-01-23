class InternalUsers < ActiveRecord::Base

	validates :name, :username, :email, presence: true
	
end
