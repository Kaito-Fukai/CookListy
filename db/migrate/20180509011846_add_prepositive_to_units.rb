class AddPrepositiveToUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :prepositive, :string
  end
end
