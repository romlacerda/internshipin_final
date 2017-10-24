class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :topic, optional: true
  belongs_to :answer, optional: true
  has_many :answer
end
