class RemoveGidFromGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :gid
  end

  def down
    add_column :groups, :gid, :integer
  end
end
