class CreateTags < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :tags, :options =>  option do |t|

      t.string	:word,		 null: false,	index: true
      t.string  :category,	 index: true

      t.timestamps
    end
  end
end
