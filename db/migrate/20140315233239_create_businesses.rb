class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :picture
      t.string :category
      t.string :phone

      t.timestamps
    end
  end
end
