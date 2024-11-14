class RemoveTaxonomicNameFromPlants < ActiveRecord::Migration[8.0]
  def change
    remove_column :plants, :taxonomic_name, :string
  end
end
