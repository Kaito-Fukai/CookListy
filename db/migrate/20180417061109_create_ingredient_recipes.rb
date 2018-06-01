class CreateIngredientRecipes < ActiveRecord::Migration[5.1]
  def change
    # create_table :ingredient_recipes   do |t|
    create_table :ingredient_recipes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'   do |t|

      t.integer	:recipe_id,		  null: false
      t.integer :ingredient_id, null: false
      t.integer :quantity,      null: false

      t.timestamps

    end
  end
end
