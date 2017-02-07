class AddListingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.integer :price
      t.string :location
      t.text :description
      t.date :available_at
      t.timestamps
    end
  end
end
