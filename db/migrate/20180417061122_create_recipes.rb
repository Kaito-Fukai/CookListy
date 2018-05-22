class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes   do |t|

   	  t.string	:recipe_name,	null: false,	index: true
   	  t.text	:memo
   	  t.text	:image_id
   	  t.integer	:user_id
   	  t.integer :admin_id

      t.timestamps
    end
  end
end
