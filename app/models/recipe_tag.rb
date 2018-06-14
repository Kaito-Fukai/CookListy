class RecipeTag < ApplicationRecord
	belongs_to :recipe, optional: true
	belongs_to :tag, optional: true

	validates :recipe_id, presence: true
	validates :tag_id, presence: true
end

