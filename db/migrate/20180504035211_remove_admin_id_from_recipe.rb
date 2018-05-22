class RemoveAdminIdFromRecipe < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :admin_id, :integer
  end
end
