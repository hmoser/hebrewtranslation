class Translation < ApplicationRecord
	belongs_to :user, optional: true
	has_many :rankings
end
