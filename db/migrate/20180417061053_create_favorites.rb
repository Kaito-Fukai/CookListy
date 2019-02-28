class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    option =  'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?
    
    create_table :favorites, :options => option do |t|

      t.integer	:user_id,	null: false
	  t.integer :recipe_id, null: false

      t.timestamps
    end
  end
end
