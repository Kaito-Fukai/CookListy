class AddStockImageIdToStockLists < ActiveRecord::Migration[5.1]
  def change
    add_column :stock_lists, :stock_image_id, :string
    add_column :stock_lists, :text, :string
  end
end
