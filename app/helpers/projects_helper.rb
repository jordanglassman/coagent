module ProjectsHelper
	def new_task_button(project_id) 
		link_to 'Add Task', new_task_path(project_id: project_id), controller: 'tasks', action: 'new', method: 'get', class: 'medium_button'
	end
end
