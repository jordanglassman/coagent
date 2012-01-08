class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :group_id
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
