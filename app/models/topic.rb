class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  enum status: [ :Aberto, :Fechado ]

  def self.search(category_id, subcategory_id)
	self.where('category_id = ? and subcategory_id = ?', category_id, subcategory_id)
  end
end
