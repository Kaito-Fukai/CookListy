class CreateShoppingLists < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :shopping_lists, :options => option do |t|

	  t.integer     :user_id,   	null: false
      t.integer		:ingredient_id
      t.integer		:quantity
      t.integer		:recipe_id

      t.timestamps
    end
  end
end
