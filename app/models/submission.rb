class Submission < ApplicationRecord
	belongs_to :user
	has_many :comments
	belongs_to :assignment
end
