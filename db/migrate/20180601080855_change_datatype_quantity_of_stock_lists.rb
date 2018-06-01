class ChangeDatatypeQuantityOfStockLists < ActiveRecord::Migration[5.1]
  def change
  	change_column :stock_lists, :quantity, :string
  end
end
