class StockList < ApplicationRecord
	belongs_to :user
	belongs_to :ingredient, optional: true

	attachment :stock_image

end
