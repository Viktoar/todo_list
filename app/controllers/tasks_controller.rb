class TasksController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @task = Task.create!(task_params)
    # redirect_to lists_path
    @list = List.find(params[:list_id])
    p @list
    respond_to do |format|
      format.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |format|
      format.js
    end
    # redirect_to root_url
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
