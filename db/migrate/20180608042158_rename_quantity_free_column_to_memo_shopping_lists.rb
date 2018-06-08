class RenameQuantityFreeColumnToMemoShoppingLists < ActiveRecord::Migration[5.1]
  def change
  	rename_column :shopping_lists, :quantity_free, :memo
  end
end
