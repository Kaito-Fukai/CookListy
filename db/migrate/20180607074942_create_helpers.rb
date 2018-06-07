class CreateHelpers < ActiveRecord::Migration[5.1]
  def change
    # create_table :helpers do |t|
    create_table :helpers, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
