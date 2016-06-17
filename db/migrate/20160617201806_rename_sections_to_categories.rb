class RenameSectionsToCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :sections, :categories
  end
end
