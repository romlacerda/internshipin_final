class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super
	end

	def show

		
	end

  	def update
		#current_user.update avatar_params
		current_user.update(about_params)
		redirect_to root_path
  	end

	def updateAvatar
		current_user.update_without_password avatar_params
		current_user.save
	end

	private
	  def about_params
	  	params.require(:user).permit(:about)
	  end

	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end

	  def sign_up_params
	    params.require(:user).permit(:nome, :sobrenome, :email, :matricula, :password, :password_confirmation, :avatar, :cpf)
	  end
end