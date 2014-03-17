class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :business_id
      t.integer :menu_item_id

      t.timestamps
    end
    add_index :menus, :business_id
    add_index :menus, :menu_item_id
    add_index :menus, [:business_id, :menu_item_id], unique: true
  end
end
