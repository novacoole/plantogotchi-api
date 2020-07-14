class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.text :description
      t.integer :max_growth

      t.timestamps
    end
  end
end
