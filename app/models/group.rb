class Group < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :originals
	belongs_to :assignment, optional: true

	accepts_nested_attributes_for :originals
end
