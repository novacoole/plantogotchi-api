class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :water_level, :default => 100
      t.integer :food_level, :default => 100
      t.references :breeds, null: false, foreign_key: true
      t.boolean :alive, :default => true
      t.integer :growth_stage, :default => 1

      t.timestamps
    end
  end
end
