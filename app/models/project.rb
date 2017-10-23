class Project < ApplicationRecord
  belongs_to :user
  has_attached_file :documentation
  validates_attachment :documentation, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  enum status: [ :Aberto, :Fechado, :Concluido]

  def self.search(titulo, datainicio, datafim, status, max_users)
	titulo = titulo.empty? ? nil : titulo.to_s
	datainicio = datainicio.empty? ? nil : datainicio.to_date
	datafim = datafim.empty? ? nil : datafim.to_date
	status = status.empty? ? nil : status.to_i
	max_users = max_users.empty? ? nil : max_users.to_i

	self.where('titulo like ?
			and (DATE(?) is null or datainicio >= DATE(?)) 
			and (DATE(?) is null or datafim >= DATE(?))
			and (? is null or status = ?)
			and (? is null or max_users = ?)', "%#{titulo}%", datainicio, datainicio, datafim, datafim, status, status, max_users, max_users)
  end

end
