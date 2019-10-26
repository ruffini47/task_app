class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :show, :update, :destroy]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user_or_correct_user, only: :show
  before_action :admin_user_or_not_logged_in_user, only: :new
  
  def show
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
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザーを更新しました。"
      # ユーザー詳細ページへ遷移する
      redirect_to user_path(@user.id)
      
      # ユーザー一覧ページへ遷移する
      #redirect_to users_path
    else
      render :edit
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def destroy
    @user.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to users_path
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
