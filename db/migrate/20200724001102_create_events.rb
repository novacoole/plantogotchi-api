class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :event_type
      t.integer :amount
      t.references :plant, null: false
      t.timestamps
    end
  end
end
