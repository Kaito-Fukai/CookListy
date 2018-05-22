class ShoppingList < ApplicationRecord
	belongs_to :user
	belongs_to :recipe, optional: true
	belongs_to :ingredient, optional: true
end
