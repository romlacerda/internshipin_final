class DashboardController < ApplicationController
before_action :authenticate_user!
layout 'dashboard'

def index
	@topic = Topic.new
	@topics = Topic.order('created_at DESC')
	@user = current_user
	@categories = Category.all
	@category = Category.new
	@subcategories = Subcategory.all
end

def topic
	@topic = Topic.find_by_id(params[:id])
	@user = current_user
	@categories = Category.all
	@subcategories = Subcategory.all
	@answer = Answer.new
	@answers = Answer.where(:topic_id => @topic.id)
end

end
