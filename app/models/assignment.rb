class Assignment < ApplicationRecord
	has_many :originals
	has_many :submissions
	has_many :groups
	has_many :translations

	accepts_nested_attributes_for :originals
end
