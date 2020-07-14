class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :water_level
      t.integer :food_level
      t.references :breeds, null: false, foreign_key: true
      t.boolean :alive
      t.integer :growth_stage

      t.timestamps
    end
  end
end
