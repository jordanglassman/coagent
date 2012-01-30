class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :single_access_token
  end
  def down
    add_column :users, :persistence_token, :string
  end
end
