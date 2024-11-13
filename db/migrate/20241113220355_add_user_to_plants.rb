class AddUserToPlants < ActiveRecord::Migration[8.0]
  def change
    add_reference :plants, :user, null: false, foreign_key: true
  end
end
