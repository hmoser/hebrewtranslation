class Assignment < ApplicationRecord
	has_many :originals
	has_many :submissions
end
