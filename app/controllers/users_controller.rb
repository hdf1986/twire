# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def follow
    user = User.find(params[:user_id])

    if current_user.follows?(user.id)
      current_user.followings.where(user: user).destroy_all
    else
      current_user.followings.create!(user: user)
    end
    head :ok
  end
end
