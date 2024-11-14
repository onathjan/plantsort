class RenameCommonNameToNameInPlants < ActiveRecord::Migration[8.0]
  def change
    rename_column :plants, :common_name, :name
  end
end
