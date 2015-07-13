class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save!
    redirect_to lists_path
  end

  def show
    @list = List.find_by_id(params[:id])
    @task = Task.new
    @tasks = @list.tasks
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    @list.update_attributes(list_params)
    redirect_to lists_path
  end

  def destroy
    @list = List.find_by_id(params[:id]).destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
