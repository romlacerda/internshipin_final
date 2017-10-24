class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @topic = Topic.find_by_id(params[:topic_id])
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answers = Answer.where(:topic_id => params[:answer][:topic_id])
    @answersChild = Answer.all
    @answerNew = Answer.new
    @user = current_user
    respond_to do |format|
    if @answer.save
      format.js  # this will look for a file names create.js.erb in views/links directory
    else
      render "new"
    end
  end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find_by_id(params[:id])
    @answersChild = Answer.all
    @answerNew = Answer.new
    @user = current_user
    @topic = Topic.find_by_id(params[:topic_id])
    @answerChild = Answer.find_by_answer_id(params[:id])
    @answerChild.destroy
    @answers = Answer.where(:topic_id => params[:topic_id])
    respond_to do |format|
      if @answer.destroy
        format.js  # this will look for a file names create.js.erb in views/links directory
      else
        render "new"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:descricao, :user_id, :topic_id, :answer_id, :project_id)
    end
end
