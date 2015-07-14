class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #Since you're not passing this instance variable to a view (it gets lost with a redirect), you can say "list" instead of "@list." Same for your update and destroy action.
    @list.save!
    #I'd use "list.save" here with a conditional -- "if list.save do X else do Y". Why? Because when your validations fail because someone didn't put in a name, you can show them the form again with an error message. As it stands right now, when someone hits submit without putting in a name, you get the angry red "ActiveRecord::RecordInvalid" form. You don't want your users to see that.
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
