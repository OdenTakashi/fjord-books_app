class UsersController < ApplicationController
  def index
    @users = User.order(:id).page params[:page]
  end

  def show
    @user = User.find_by(params[:id])
  end
end
