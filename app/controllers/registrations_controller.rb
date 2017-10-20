class RegistrationsController < ApplicationController
	def getDadosCadastro
		@universidade = Universidade.find_by_matricula_and_cpf(params[:matricula], params[:cpf])
		render json: @universidade	
	end

  	def update
		#current_user.update_without_password avatar_params
  	end

	private

	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end

	  def sign_up_params
	    params.require(:user).permit(:nome, :email, :matricula, :password, :password_confirmation, :avatar)
	  end

	  def account_update_params
	    params.require(:user).permit(:avatar)
	  end
end
