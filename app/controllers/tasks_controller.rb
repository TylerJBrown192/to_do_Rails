class TasksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @task = @list.task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(params[:task])
      flash[:notice] = "Task successfully updated!"
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    flash[:alert] = "Task successfully destroyed :("
    redirect_to list_path(@list)
  end


private
  def task_params
    params.require(:task).permit(:description)
  end

end
