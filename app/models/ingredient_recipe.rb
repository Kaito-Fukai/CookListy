class IngredientRecipe < ApplicationRecord
	belongs_to :ingredient, optional: true
	belongs_to :unit, optional: true
	belongs_to :recipe, optional: true

	validates :recipe_id, presence: true
	validates :ingredient_id, presence: true
	validates :quantity, presence: true

end
