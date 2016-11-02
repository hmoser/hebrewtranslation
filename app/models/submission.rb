class Submission < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments
	belongs_to :assignment, optional: true
end
