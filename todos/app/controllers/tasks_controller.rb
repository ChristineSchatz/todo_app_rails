class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to lists_path
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  private

  def task_params
    params.require(:list).permit(:description)
  end
end
