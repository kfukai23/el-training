class Admin::UsersController < ApplicationController
  # before_action :admin_required

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: 'ユーザー「#{@user.name}」を作成しました。'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザー#{@user.name}を更新しました。'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザー「#{@user.name}」を削除しました。'
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  # def admin_required
  #   redirect_to tasks_path unless current_user.admin?
  # end
end
