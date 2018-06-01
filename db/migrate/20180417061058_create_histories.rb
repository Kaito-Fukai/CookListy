class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    # create_table :histories do |t|
    create_table :histories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.integer	:user_id,	null: false
      t.integer :recipe_id, null: false

      t.timestamps
    end
  end
end
