class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super
	end


	def updateAvatar
		current_user.update_without_password avatar_params
		current_user.save

	end

	private
	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end

	  def sign_up_params
	    params.require(:user).permit(:nome, :sobrenome, :email, :matricula, :password, :password_confirmation, :avatar, :cpf)
	  end
end