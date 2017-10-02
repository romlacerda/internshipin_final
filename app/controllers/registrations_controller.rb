class RegistrationsController < ApplicationController
	def getDadosCadastro
		@universidade = Universidade.find_by_matricula_and_cpf(params[:matricula], params[:cpf])
		render json: @universidade	
	end


	private

	  def sign_up_params
	    params.require(:user).permit(:nome, :email, :matricula, :password, :password_confirmation)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation, :current_password)
	  end
end
