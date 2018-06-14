class Step < ApplicationRecord
	belongs_to :recipe, optional: true

	validates :steps_order, presence: true
	validates :steps_expression, presence: true
end
