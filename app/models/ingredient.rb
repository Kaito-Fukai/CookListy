class Ingredient < ApplicationRecord
	has_many :shopping_lists
	has_many :stock_lists
	has_many :ingredient_recipes, dependent: :destroy
	has_many :recipes, through: :ingredient_recipes
	belongs_to :unit, optional: :true
end
