class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @user = current_user
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_dashboard_path
  end

  def close
    project = Project.find(params[:id])
    project.status = 2
    project.save

    redirect_to show_project_dashboard_path(project)
  end

  def andamento
    project = Project.find(params[:id])
    project.status = 1
    project.save
    redirect_to show_project_dashboard_path(project)
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @user = current_user
    @project = Project.find_by_id(params[:id])
    @projects = Project.all.order('created_at DESC')
    @submissionsCount = Submission.where(:project_id => params[:id]).count
    
    @submissions = Submission.where(:project_id => params[:id])
    @answers = Answer.where(:project_id => params[:id])

    if @submissions.present?
      @submissions.destroy_all
    end

    if @answers.present?
      @answers.destroy_all
    end

    respond_to do |format|
      if @project.destroy
        format.js  # this will look for a file names create.js.erb in views/links directory
      else
        render "new"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:max_users, :titulo, :descricao, :prazo, :total_hours, :datainicio, :datafim, :user_id, :documentation)
    end
end
