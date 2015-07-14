class TasksController < ApplicationController
  def create
    @list = List.find_by_id(params[:list_id])
    @task = Task.new(tasks_params)
    @task.list_id = (params[:list_id])
    @task.save!
    # careful, you need @task.list_id below because currently this breaks
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
    #Because you're manually assigning "@task.list_id = (params[:list_id])" on line 5, you don't need to permit list_id below. You would need to do this if you were getting list_id by a hidden field tag on the submitted form.
    params.require(:task).permit(:description)#, :completed, :list_id)
  end
end
