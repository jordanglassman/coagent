class PanopticObserver < ActiveRecord::Observer
	observe User, Group
	def after_save(model)
		
	end
end
