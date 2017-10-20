class User < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/semfoto.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :trackable, :validatable
	enum access: { "Aluno" => 0, "Professor" => 1, "Administrador" => 2}
	
end
