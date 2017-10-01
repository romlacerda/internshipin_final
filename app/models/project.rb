class Project < ApplicationRecord
  belongs_to :user
  has_attached_file :documentation
  validates_attachment :documentation, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  enum status: [ :Aberto, :Fechado, :Concluido]
end
