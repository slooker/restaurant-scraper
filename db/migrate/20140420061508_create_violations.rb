class CreateViolations < ActiveRecord::Migration
  def up
#    create_table(:violations, :id => false) do |t|
    create_table:violations do |t|
#      t.integer :id, :options => 'PRIMARY_KEY'
      t.string :code
      t.integer :demerits
      t.string :description
      t.timestamps
    end
  end

  def down
    drop_table :violations
  end
end
