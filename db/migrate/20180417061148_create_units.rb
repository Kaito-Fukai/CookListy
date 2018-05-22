class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'    do |t|
      t.string :unit_name
      t.integer :cc

      t.timestamps
    end
  end
end
