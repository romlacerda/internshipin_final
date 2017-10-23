class DashboardController < ApplicationController
before_action :authenticate_user!
layout 'dashboard'

def index
	@topic = Topic.new
	logger.debug(@topic.inspect)
	if params[:topic]
		@topics = Topic.search(params[:topic][:category_id], params[:topic][:subcategory_id]).order('created_at DESC')
	else
		@topics = Topic.all.order('created_at DESC')
	end
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
	@answersChild = Answer.all
	@answersCount = Answer.where(:topic_id => params[:id]).count
end

def editTopic
	@topic = Topic.find_by_id(params[:id])
	@user = current_user
	@categories = Category.all
	@subcategories = Subcategory.all
	@answer = Answer.new
	@answers = Answer.where(:topic_id => @topic.id)	
end

def answer_box_show
	@answer = Answer.new
	@answerFather = Answer.find_by_id(params[:id])
	@user = current_user
	respond_to do |format|
		format.js
	end
end

def projects
	@user = current_user
	@project = Project.new
	logger.debug(@project.inspect)	
	if params[:project]
		@projects = Project.search(params[:project][:titulo], params[:project][:datainicio], params[:project][:datafim], params[:project][:status], params[:project][:max_users]).order('created_at DESC')
	else
		@projects = Project.all.order('created_at DESC')
	end
	@submissionsCount = Submission.where(:project_id => params[:id]).count
end

def newProject
	@user = current_user
	@project = Project.new
end

def project
	@project = Project.find_by_id(params[:id])
	@user = current_user
	@submissionsCount = Submission.count('project_id')
	@members = Submission.where(:project_id => params[:id])
end

def editProject
	@project = Project.find_by_id(params[:id])
	@user = current_user
end

def newSubmission
	@user = current_user
	@submission = Submission.new
end

end
