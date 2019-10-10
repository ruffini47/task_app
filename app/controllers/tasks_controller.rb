class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id:params[:user_id])
    @user = User.find_by(id: params[:user_id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
   
    @task = Task.new(task_params)
    @task.user_id= params[:user_id]
  
    if @task.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to user_tasks_path(params[:user_id])
    else
      render :new
    end
  end
  
  private

    def task_params
      params.require(:task).permit(:title, :details, :user_id)
    end
    
end
