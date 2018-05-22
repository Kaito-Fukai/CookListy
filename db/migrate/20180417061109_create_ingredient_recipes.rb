class CreateIngredientRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_recipes   do |t|

      t.integer	:recipe_id,		  null: false
      t.integer :ingredient_id, null: false
      t.integer :quantity,      null: false

      t.timestamps

    end
  end
end
