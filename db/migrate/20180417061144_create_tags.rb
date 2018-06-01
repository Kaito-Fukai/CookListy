class CreateTags < ActiveRecord::Migration[5.1]
  def change
    #create_table :tags, :options do |t|
    create_table :tags   do |t|

      t.string	:word,		 null: false,	index: true
      t.string  :category,	 index: true

      t.timestamps
    end
  end
end
