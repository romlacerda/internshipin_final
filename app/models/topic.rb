class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_many :answer
  enum status: [ :Aberto, :Fechado ]

  def self.search(category_id, subcategory_id)
	category_id = category_id.empty? ? nil : category_id.to_i
	subcategory_id = subcategory_id.empty? ? nil : subcategory_id.to_i

	self.where('(? is null or category_id = ?) and (? is nil or sub_category_id = ?)', category_id, subcategory_id)
  end
end
