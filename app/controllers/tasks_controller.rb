class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
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
  
  def edit
  end
  
  def update
    @task.user_id= params[:user_id]
    if @task.update_attributes(task_params)
      flash[:success] = "タスク情報を更新しました。"
      redirect_to user_tasks_path(params[:user_id])
    else
      render :edit
    end
  end

  # attendance system の　user update
  #def update
  #  if @user.update_attributes(user_params)
  #    flash[:success] = "ユーザー情報を更新しました。"
  #    redirect_to @user
  #  else
  #    render :edit      
  #  end
  #end

  def show
  end
  
  private

    def task_params
      params.require(:task).permit(:title, :details, :user_id)
    end

    def set_task
      @task = Task.find_by(id:params[:id], user_id:params[:user_id])
    end
end
