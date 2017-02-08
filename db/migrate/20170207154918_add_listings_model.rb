class AddListingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :price
      t.string :location
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
