class UsersController < ApplicationController
	layout 'perfil'

	def show
	    #@user = User.find(params[:id])
	    @user = current_user
    	# If this show page is only for the currently logged in user change it to @user = current_user
  	end

  	def update
		#current_user.update avatar_params
  	end


	private

	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end
	end
end
