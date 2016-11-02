class Group < ApplicationRecord
	has_many :users
	has_many :originals
	belongs_to :assignment, optional: true
end
