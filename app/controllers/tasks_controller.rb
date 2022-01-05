class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose :task
  expose :list 
  

  def new

  end

  def create
    @task = list.tasks.create!(task_params)
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    task.update(task_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    task.destroy
    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.find(id).update(order: index+1)
    end
  end

  def index
  end

  private

  def task_params
    params.require(:task).permit(:done, :name, :list_id, :deadline)
  end
end

