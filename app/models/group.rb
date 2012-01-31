class Group < ActiveRecord::Base
	has_and_belongs_to_many :users, uniq: true
  acts_as_audited with_associations: :users
end
