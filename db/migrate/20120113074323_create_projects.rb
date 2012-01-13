class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :project_manager
      t.string :technical_lead
      t.integer :tl_uid
      t.string :project_manager
      t.integer :pm_uid
      t.date :due_date
      t.string :phase
      t.text :status
      t.datetime :status_last_updated
      t.text :key_resources

      t.timestamps
    end
  end
end
