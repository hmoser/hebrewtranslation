class Assignment < ApplicationRecord
	has_many :originals
	has_many :submissions
	has_many :groups

	accepts_nested_attributes_for :originals
end
