class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :type
      t.string :name
      t.integer :mistake
      t.integer :speed
      t.integer :operations
      t.integer :size
      t.boolean :intelect
      t.string :discharge
      t.float :price
      t.integer :integral
    end
  end
end