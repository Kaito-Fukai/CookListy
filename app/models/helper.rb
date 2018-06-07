class Helper < ApplicationRecord
	belongs_to :user, optional: true
end
