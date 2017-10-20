class UserController < ApplicationController
	def show
	    #@user = User.find(params[:id])
	    @user = current_user

    	# If this show page is only for the currently logged in user change it to @user = current_user
  	end

  	def updateAvatar
		#current_user.update avatar_params
  	end
end
