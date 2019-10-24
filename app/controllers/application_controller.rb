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
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
    
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
  
  # 管理者、またはログインユーザー本人である場合認可する機能を追加
  def admin_user_or_correct_user
    redirect_to root_url  unless (current_user.admin? || current_user?(@user))
  end
  
end
