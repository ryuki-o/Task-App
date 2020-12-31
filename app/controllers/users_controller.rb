class UsersController < ApplicationController
  before_action :limitation_correct_user, only: [:edit, :update]
  
  
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
       flash[:success] = "ユーザー情報を更新しました。"
       redirect_to @user
    else
      render :edit      
    end
  end
  
  def tasks
    @user = User.find(params[:id])
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  def limitation_correct_user
    unless @current_user.id == params[:id].to_i
      flash[:notice] = "他のユーザーの編集はできません。"
      redirect_to @user
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
