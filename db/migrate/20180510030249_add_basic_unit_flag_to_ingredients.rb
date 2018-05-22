class AddBasicUnitFlagToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :basic_unit_flag, :boolean, default: false
  end
end
