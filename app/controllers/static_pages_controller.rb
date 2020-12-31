class StaticPagesController < ApplicationController
  def top
    @user = User.find_by(params[:name])
  end
end
