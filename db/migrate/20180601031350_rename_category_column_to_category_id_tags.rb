class RenameCategoryColumnToCategoryIdTags < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tags, :category, :category_id
  end
end
