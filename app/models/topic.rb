class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
end