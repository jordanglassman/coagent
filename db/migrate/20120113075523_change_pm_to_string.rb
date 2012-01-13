class ChangePmToString < ActiveRecord::Migration
  def up
    change_column :projects, :project_manager, :string
  end

  def down
    change_column :projects, :project_manager, :integer
  end
end
