class RemoveAnotherColumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :perishable_token
  end

  def down
    remove_column :users, :perishable_token, :string
  end
end
