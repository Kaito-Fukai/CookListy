class Recipe < ApplicationRecord

  has_many :shopping_lists
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :ingredient_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_recipes
  has_many :favorites, dependent: :destroy
  has_many :histories
  has_many :steps, dependent: :destroy
  has_many :recently_cooked_recipes, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :administrator, optional: true

  attachment :image

  accepts_nested_attributes_for :ingredient_recipes, allow_destroy: true
  accepts_nested_attributes_for :recipe_tags, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
end
