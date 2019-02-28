class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    option = 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' if Rails.env.production?
    
    create_table :units, :options => option do |t|

      t.string :unit_name
      t.integer :cc

      t.timestamps
    end
  end
end
