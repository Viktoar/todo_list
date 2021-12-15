class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
  end

  def create
    @task = Task.create!(task_params)
    redirect_to @task.list
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task.list
  end

  def destroy
  end

  def index
  end

  private

  def task_params
    params.require(:task).permit(:done, :name, :list_id)
  end
end
