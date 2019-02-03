class Api::V1::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Show all project tasks
  def index
    @project = Project.find_by(id: params[:project_id])
    @task = @project.tasks
    if @task 
      render :json => @task
    else
      render :json => 422
    end
  end

  # Show all user tasks
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

  # Show task by id
  def show
    @task = Task.find_by(id: params[:id])
    if @task
        render :json => @task
    else
      render :json => 422
    end
  end

  # New Task
  def new
    @task = Task.new
  end

  # Create Task
  def create
    @task = Task.new(task_params)
    if @task.save
      render :json => 201
    else
      render :json => { :errors => @task.errors.full_messages }
    end
  end
  
  # Update task
  def update
    @task = Task.find_by(id: params[:id])
      if @task.update(task_params)
        render :json => 201
    else
      render :json => { :errors => @task.errors.full_messages }
    end
  end

  # Delete task
  def destroy
    @task = Task.find_by(id: params[:id])
      if @task.destroy
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

