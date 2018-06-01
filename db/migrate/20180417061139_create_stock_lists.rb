class CreateStockLists < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_lists   do |t|

      t.integer		:ingredient_id
      t.string		:ingredient_free_name
      t.integer		:quantity
      t.datetime	:limit
      t.integer		:user_id,		 null: false

      t.timestamps
    end
  end
end
