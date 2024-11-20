class RenameNameToCommonNameInPlants < ActiveRecord::Migration[8.0]
  def change
    rename_column :plants, :name, :common_name
  end
end
