class AddPhotoColumnsToMenuItems < ActiveRecord::Migration
  def self.up
	  change_table :menu_items do |t|
	    t.attachment :photo
	  end
	  def change
	    add_column :menu_items, :photo_file_name
	  end	
  end

  def self.down
	drop_attached_file :menu_items, :photo	
  end
end
