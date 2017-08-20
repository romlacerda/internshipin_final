class Category < ApplicationRecord
	has_one :topic
	has_one :subcategory
end
