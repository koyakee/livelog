class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def show; end
  
  def edit; end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = current_user
  end
  
  def user_params
    params.require(:user).permit(:name, :email) # 必要に応じて項目追加
  end
end

