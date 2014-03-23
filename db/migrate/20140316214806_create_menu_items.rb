class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string  :name
      t.text    :description
      t.integer :business_id
      t.decimal :price, precision: 12, scale: 2
      t.integer :menu_id

      t.timestamps
    end
    add_index :menu_items, [:business_id, :created_at]
  end
end
