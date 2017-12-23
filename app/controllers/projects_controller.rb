class ProjectsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy!

    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = 'Project was updated.'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Project was created'
      redirect_to projects_path
    else
      render :new
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
