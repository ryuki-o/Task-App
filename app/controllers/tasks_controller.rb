class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :limitation_correct_user, only: [:new]
  before_action :admin_user, only: [:edit, :update, :destroy]
  
  def index
    @tasks =@user.tasks
  end
  
  def show
    @task = @user.tasks.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
        flash[:success] = "タスクを新規登録しました"
    redirect_to user_tasks_path(@user)
    else
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました"
      redirect_to user_task_path(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:danger] = "タスクを削除しました"
    redirect_to user_tasks_path
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  
  def task_params
    params.require(:task).permit(:name, :description)
  end
  
  def limitation_correct_user
    @user = User.find(params[:user_id])
    unless @user.id == @current_user.id
      flash[:danger] = "自分以外のユーザーの投稿はできません"
      redirect_to root_url
    end
  end
  
  def admin_user
    @user = User.find(params[:user_id])
    unless @user.id == @current_user.id
      flash[:danger] = "あなたにはその権限はありません"
      redirect_to user_tasks_url
    end
  end
end
  

