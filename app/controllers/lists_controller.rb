class ListsController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose :lists, -> { List.all }
  expose :list

  def new
    @list = List.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @list = List.create(list_params)
    p @list.id 
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def edit
  end

  def update
    list.update(list_params)
  end

  def destroy
    list.destroy

  end

  def index
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
