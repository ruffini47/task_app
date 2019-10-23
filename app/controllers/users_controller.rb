class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザーを更新しました。"
      # 最終的にユーザー一覧ページにリダイレクトしたいが、無いので取り敢えずshowページにリダイレクトしておく
      redirect_to user_path(@user.id)
      # redirect_to users_path
    else
      render :edit
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to users_path
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
