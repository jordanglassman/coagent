class CreateInternalUsers < ActiveRecord::Migration
  def change
    create_table :internal_users do |t|
      t.string :username
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
