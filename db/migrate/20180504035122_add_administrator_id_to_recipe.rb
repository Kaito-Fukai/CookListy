class AddAdministratorIdToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :administrator_id, :integer
  end
end
