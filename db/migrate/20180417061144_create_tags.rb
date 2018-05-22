class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'    do |t|

      t.string	:word,		 null: false,	index: true
      t.string  :category,	 null: false,	index: true

      t.timestamps
    end
  end
end
