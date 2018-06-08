class AddStuffNameToShoppingList < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_lists, :stuff_name, :string
    add_column :shopping_lists, :quantity_free, :string
  end
end
