class CreateRecentlyCookedRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recently_cooked_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
