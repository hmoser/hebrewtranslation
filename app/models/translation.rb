class Translation < ApplicationRecord
	belongs_to :user, optional: true
	has_many :rankings
	belongs_to :assignment, optional: true
end
