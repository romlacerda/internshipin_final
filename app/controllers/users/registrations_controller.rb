class Users::RegistrationsController < Devise::RegistrationsController

	def updateAvatar
		current_user.update_without_password avatar_params
		current_user.save

	end

	private
	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end

end