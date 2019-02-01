class Api::V1::ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects
    if @project 
      render :json => @project
    else
      render :json => 422
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
    if @project
      render :json => @project
    else
      render :json => 422
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    puts @project
    if @project.save
      render :json => 201
    else
      render :json => 422
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :user_id)
    end
end
