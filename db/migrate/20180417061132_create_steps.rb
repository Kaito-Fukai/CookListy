class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps   do |t|

      t.integer :recipe_id,				null: false
      t.text	:steps_expression,		null: false
      t.integer	:steps_order,			null: false

      t.timestamps
    end
  end
end
