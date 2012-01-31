class RemovePriorityFromOngoingSupportProjects < ActiveRecord::Migration
  def up
  	Project.all.each do |p|
  		if p.phase == 'Ongoing support'
  			p.update_attributes!(priority: 0)
  		end
  	end
  	counter = 1
  	Project.find_all_by_phase('To be delivered', order: :priority).each do |p|
  		if p.priority != counter
  			p.update_attributes!(priority: counter)
  		end
  		counter += 1
  	end
  end

  def down
  end
end
