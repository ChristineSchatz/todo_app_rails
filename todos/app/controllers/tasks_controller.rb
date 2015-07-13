class TasksController < ApplicationController
  def create
    @list = List.find_by_id(params[:list_id])
    @task = Task.new(tasks_params)
    @task.list_id = (params[:list_id])
    @task.save!
    redirect_to list_path(id: task.list_id)
  end

  def edit
    @list = List.find_by_id(params[:list_id])
    @task = Task.find_by_id(params[:id])
  end

  def update
    task = Task.find_by_id(params[:id])
    task.update_attributes(tasks_params)
    # Task.update(params[:id], tasks_params)
    redirect_to list_path(id: task.list_id)
  end

  def destroy
    task = Task.find_by_id(params[:id])
    task.destroy
    redirect_to list_path(id: task.list_id)
  end

  private
  def tasks_params
    params.require(:task).permit(:description, :completed, :list_id)
  end
end
