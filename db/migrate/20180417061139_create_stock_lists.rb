class CreateStockLists < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :stock_lists, :options => option do |t|

      t.integer		:ingredient_id
      t.string		:ingredient_free_name
      t.integer		:quantity
      t.datetime	:limit
      t.integer		:user_id,		 null: false

      t.timestamps
    end
  end
end
