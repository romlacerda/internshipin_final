class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  def search
    @topics = Topic.where('category_id = ? and subcategory_id = ?', params[:category_id][:subcategory_id])

  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @answers = Answer.all
    @topics = Topic.all.order('created_at DESC')
    @user = current_user
    respond_to do |format|
      if @topic.save
        format.js  # this will look for a file names create.js.erb in views/links directory
      else
        render "new"
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    @topic.update(topic_params)
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find_by_id(params[:id])
    @user = current_user
    #@answerChild = Answer.find_by_answer_id(params[:id])
    #@answerChild.destroy
    @answers = Answer.where(:topic_id => params[:id])
    if @answers.present?
        @answerChild = Answer.where(:answer_id => @answers.ids)
        if @answerChild.present?
          @answerChild.destroy_all
        end
      @answers.destroy_all
    end

    @topics = Topic.all.order('created_at DESC')
    respond_to do |format|
      if @topic.destroy
        format.js  # this will look for a file names create.js.erb in views/links directory
      else
        render "new"
      end
    end
  end

  def close
    topic = Topic.find(params[:id])
    topic.status = 1
    topic.save

    redirect_to show_topic_dashboard_path(topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:titulo, :descricao, :user_id, :status, :tipo, :category_id, :subcategory_id)
    end
end
