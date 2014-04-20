class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.integer :permit_id
      t.string :permit_number
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :city
      t.string :zip
      t.string :current_grade
      t.string :category
      t.datetime :current_inspection_date
      t.string :current_inspection_type
      t.integer :demerits
      t.timestamps
    end
      add_index :restaurants, :permit_number, :unique => true
      add_index :restaurants, :permit_id, :unique => true
  end

  def down
    drop_table :restaurants
  end
end
