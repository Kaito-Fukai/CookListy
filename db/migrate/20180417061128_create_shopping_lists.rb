class CreateShoppingLists < ActiveRecord::Migration[5.1]
  def change
    # create_table :shopping_lists   do |t|
    create_table :shopping_lists, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'   do |t|

	  t.integer     :user_id,   	null: false
      t.integer		:ingredient_id
      t.integer		:quantity
      t.integer		:recipe_id

      t.timestamps
    end
  end
end
