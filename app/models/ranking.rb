class Ranking < ApplicationRecord
	belongs_to :translation, optional: true
end
