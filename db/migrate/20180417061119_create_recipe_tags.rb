class CreateRecipeTags < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :recipe_tags, :options => option do |t|

      t.integer	:recipe_id,	null: false
      t.integer :tag_id,    null: false

      t.timestamps

    end
  end
end
