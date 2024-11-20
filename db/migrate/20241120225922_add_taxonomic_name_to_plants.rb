class AddTaxonomicNameToPlants < ActiveRecord::Migration[8.0]
  def change
    add_column :plants, :taxonomic_name, :string
  end
end
