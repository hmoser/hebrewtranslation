class Ranking < ApplicationRecord
	belongs_to :translation, optional: true
	belongs_to :user, optional: true
end
