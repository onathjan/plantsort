class CreateJoinTableCategoryPlant < ActiveRecord::Migration[8.0]
  def change
    create_join_table :categories, :plants do |t|
      t.index [ :category_id, :plant_id ]
      t.index [ :plant_id, :category_id ]
    end
  end
end
