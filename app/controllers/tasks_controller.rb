class TasksController < ApplicationController

  def create
      @list = List.find(params[:list_id])
      @task = @list.tasks.create(task_params)
      if @task.new_record?
        redirect_to list_path(@list.id)
        flash[:danger] = @task.errors.messages[:title][0]
      else
        redirect_to list_path(@list.id)
      end 
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(params[:list_id])
  end

  def toggle
    render body: nil
    @task = Task.find(params[:id])
    @task.done = !@task.done
    @task.save
  end

  private

  def task_params
      params[:task].permit(:title, :deadline)
  end
end
