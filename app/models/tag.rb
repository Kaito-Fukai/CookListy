class Tag < ApplicationRecord
	has_many :recipe_tags,  dependent: :destroy
	has_many :recipes, through: :recipe_tags
	belongs_to :tag_category, optional: true

end
