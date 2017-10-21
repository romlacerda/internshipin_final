class UsersController < ApplicationController
	layout 'perfil'

	def show
	    #@user = User.find(params[:id])
	    @user = current_user
	    @topics = Topic.where(:user_id => current_user.id).order(:id => :desc).limit(5)
  	end

  	def update
		#current_user.update avatar_params
  	end


	private

	  def avatar_params
	  	params.require(:user).permit(:avatar)
	  end
end
