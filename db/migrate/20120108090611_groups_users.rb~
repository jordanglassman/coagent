class GroupsUsers < ActiveRecord::Migration
  def up
  				create_table :groups_users, id: false do |t|
  								t.references :group, null: false
  								t.references :user, null: false
  				end
  				add_index :groups_users, [:group_id,:user_id], unique: true
  end

  def down
  				remove_index :groups_users
  				drop_table :groups_users
  end
end
