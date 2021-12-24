class ListsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @list = List.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @list = List.create(list_params)
    p @list.id 
    @lists = List.all
    respond_to do |format|
      format.js
    end
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

  end

  def index
    @lists = List.all
    @task = Task.new
    # @tasks = Task.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
