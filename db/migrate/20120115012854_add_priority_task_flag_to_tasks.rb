class AddPriorityTaskFlagToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :priority_task_flag, :boolean, default: false
  end
end
