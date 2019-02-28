class CreateIngredientRecipes < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :ingredient_recipes, :options => option do |t|

      t.integer	:recipe_id,		  null: false
      t.integer :ingredient_id, null: false
      t.integer :quantity,      null: false

      t.timestamps

    end
  end
end
