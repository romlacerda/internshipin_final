class RegistrationsController < ApplicationController
	private

	  def sign_up_params
	    params.require(:user).permit(:nome, :email, :matricula, :password, :password_confirmation)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation, :current_password)
	  end
end
