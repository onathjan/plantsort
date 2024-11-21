class AddUserReferenceToCategories < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :categories, :users
  end
end
