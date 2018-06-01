class ChangeDatatypeCategoryOfTags < ActiveRecord::Migration[5.1]
  def change
  	change_column :tags, :category, :integer
  end
end
