class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
			t.string :name
			t.text :announcement
			
      t.timestamps
    end
  end
end
