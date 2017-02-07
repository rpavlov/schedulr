class AddListingsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :listings_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :listing
    end
  end
end
