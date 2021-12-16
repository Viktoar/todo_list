class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
  end

  def create
    @task = Task.create!(task_params)
    redirect_to lists_path
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
    Task.find(params[:id]).destroy
    redirect_to List.find(params[:list_id])
  end

  def index
  end

  private

  def task_params
    params.require(:task).permit(:done, :name, :list_id, :order)
  end
end
