class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @list = List.find(params[:list_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @task = Task.create!(task_params)
    @list = List.find(params[:list_id])
    p @list
    respond_to do |format|
      format.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    @list = @task.list
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    p params[:id]
    @task.update(task_params)
    @list = @task.list
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @list = @task.list
    @task.destroy
    respond_to do |format|
      format.js
    end
    # redirect_to List.find(params[:list_id])
  end

  def index
  end

  private

  def task_params
    params.require(:task).permit(:done, :name, :list_id, :order, :deadline)
  end
end

