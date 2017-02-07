class AddListingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.integer :price
      t.string :location
      t.text :description
      t.date :start_at
      t.date :end_at
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
