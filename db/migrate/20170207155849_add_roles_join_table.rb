class AddRolesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
  end
end
