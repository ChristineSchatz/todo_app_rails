class TasksController < ApplicationController
  def create
    @list = List.find_by_id(params[:list_id])
    @task = Task.new(tasks_params)
    @task.list_id = (params[:list_id])
    @task.save!
    redirect_to lists_path
  end

  def edit
    @list = List.find_by_id(params[:list_id])
    @task = Task.find_by_id(params[:id])
  end

  def update

  end

  def destroy
  end

  private
  def tasks_params
    params.require(:task).permit(:description, :completed, :list_id)
  end
end
