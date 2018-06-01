class CreateRecipeTags < ActiveRecord::Migration[5.1]
  def change
    # create_table :recipe_tags   do |t|
    create_table :recipe_tags, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'   do |t|

      t.integer	:recipe_id,	null: false
      t.integer :tag_id,    null: false

      t.timestamps

    end
  end
end
