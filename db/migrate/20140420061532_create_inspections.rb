class CreateInspections < ActiveRecord::Migration
  def up
    create_table :inspections do |t|
      t.string :inspection_id
      t.string :permit_number
      t.datetime :date
      t.integer :demerits
      t.string :grade
      t.string :inspection_type
      t.string :permit_status
      t.belongs_to :restaurant
      t.timestamps
    end
    add_index :inspections, :inspection_id, :unique => true

    create_table :inspections_violations do |t|
      t.integer :inspection_id
      t.integer :violation_id
    end
  end

  def down
    drop_table :inspections
    drop_table :inspections_violations
  end
end
