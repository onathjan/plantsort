class CreatePlants < ActiveRecord::Migration[8.0]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :taxonomic_name

      t.timestamps
    end
  end
end
