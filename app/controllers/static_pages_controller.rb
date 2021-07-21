class StaticPagesController < ApplicationController
  before_action :correct_user
  before_action :admin_user, only: [:top]
  
  def top
    @user = User.find_by(params[:user_id])
  end
  
  private

   def admin_user
     @user = User.find_by(params[:user_ud])
   end
  
   def correct_user
   end
end