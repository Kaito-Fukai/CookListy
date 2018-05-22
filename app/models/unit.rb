class Unit < ApplicationRecord
	has_many :ingredients, dependent: :destroy
	has_many :ingredient_recipe, through: :ingredients
end
