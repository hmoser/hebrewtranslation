class Comment < ApplicationRecord
	belongs_to :submission, optional: true
end
