class UsersController < ApplicationController
	layout 'perfil'

	def show
	    #@user = User.find(params[:id])
	    @user = current_user
	    @topics = Topic.where(:user_id => current_user.id).order(:id => :desc).limit(5)
	    @answers = Answer.joins(:topic).where("user_id" => current_user.id).order(:id => :desc).limit(5)
  	end

  	def update
		#current_user.update avatar_params
		current_user.update(about_params)
  	end


	private

	  def about_params
	  	params.require(:user).permit(:about)
	  end

	  def avatar_params
	  	params.require(:user).permit(:avatar, :about)
	  end
end
