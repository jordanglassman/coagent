class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.integer :project_id
      t.string :name
      t.text :description
      t.date :due_date
      t.text :notes
      t.integer :severity
      t.integer :status
      t.string :resource
      t.string :deliverable
      t.datetime :completed_date

      t.timestamps
    end
  end
end
