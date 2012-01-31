class GroupsUsers < ActiveRecord::Base
	acts_as_audited
	after_save: :test1
	#after_create: :test2
	
	def test1
		logger.info 'TEST1'
	end
	def test2
		logger.info 'test2'
	end
end
