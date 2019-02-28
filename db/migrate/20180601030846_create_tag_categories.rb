class CreateTagCategories < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?

    create_table :tag_categories, :options => option do |t|

      t.string :name

      t.timestamps
    end
  end
end
