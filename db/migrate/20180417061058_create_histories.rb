class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|

      t.integer	:user_id,	null: false
      t.integer :recipe_id, null: false

      t.timestamps
    end
  end
end
