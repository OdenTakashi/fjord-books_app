# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @friendship = current_user.active_friendships.find_by(followed: @user)
  end

  def followings
    @user  = User.find(params[:id])
    @users = @user.followings.with_attached_avatar.order(:id)
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
