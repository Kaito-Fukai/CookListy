class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    # create_table :ingredients   do |t|
    create_table :ingredients, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'   do |t|

	    t.string	:name,				null: false, index: true, limit: 191
      t.string	:name_kana, 		null: false, index: true, limit: 191
      t.integer :unit_id
      t.string 	:category,			null: false, index: true, limit: 191
      t.string	:name_with_unit, 				 index: true, limit: 191
      t.string  :specific_gravity
   	  t.string	:unit_in_lists

      t.timestamps
    end
  end
end
