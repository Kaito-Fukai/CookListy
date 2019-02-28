class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :steps, :options => option do |t|

      t.integer :recipe_id,				null: false
      t.text	:steps_expression,		null: false
      t.integer	:steps_order,			null: false

      t.timestamps
    end
  end
end
