class Api::V1::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @project = Project.find_by(id: params[:project_id])
    @task = @project.tasks
    if @task 
      render :json => @task
    else
      render :json => 422
    end
  end

  def all_tasks
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects
    @tasks = Array.new
    @project.each do |project|
        @tasks.push(project.tasks) 
    end 
    if @tasks
        render :json => @tasks
    else
      render :json => 422
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task
        render :json => @task
    else
      render :json => 422
    end
  end

  # GET /projects/new
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    puts @task
    if @task.save
      render :json => 201
    else
      render :json => 422
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
      if @task.update(task_params)
        render :json => 201
    else
      render :json => 422
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :time, :is_running, :project_id)
    end
end

