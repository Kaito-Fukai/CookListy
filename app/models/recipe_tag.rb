class RecipeTag < ApplicationRecord
	belongs_to :recipe, optional: true
	belongs_to :tag, optional: true
end
