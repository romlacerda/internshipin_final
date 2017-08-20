class Subcategory < ApplicationRecord
	belongs_to :category
	#has_one :topic
end
