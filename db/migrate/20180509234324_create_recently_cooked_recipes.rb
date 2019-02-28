class CreateRecentlyCookedRecipes < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :recently_cooked_recipes, :options => option do |t|

      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
