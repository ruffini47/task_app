class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end
  
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
    end
  end

  def logged_out_user
    if logged_in?
        flash[:danger] = "すでにログインしています。"
        redirect_to user_url(current_user.id)
    end
  end      
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
    
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
  
  # edit update前にアクセスしたユーザーが現在ログインしているユーザーでない場合警告してタスク一覧ページへリダイレクト。
  def correct_user_for_edit_update
    unless current_user?(@user)
      flash[:danger] = "権限がありません。"
      redirect_to user_tasks_path(current_user.id)
    end
  end
  
  # 管理者、またはログインユーザー本人である場合認可する機能を追加
  def admin_user_or_correct_user
    redirect_to root_url  unless (current_user.admin? || current_user?(@user))
  end
  
  #ログインしている管理者かログアウト状態の場合認可する機能を追加
  def admin_user_or_not_logged_in_user

    if logged_in? and current_user.admin?
    elsif logged_in?
      flash[:danger] = "すでにログインしています。"
      # ユーザー詳細ページへリダイレクト
      redirect_to user_path(current_user.id)
    end
  end

end
