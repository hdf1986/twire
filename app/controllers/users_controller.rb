class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    user = User.find(params[:user_id])

    if current_user.follows?(user.id)
      current_user.followings.where(user: user).destroy_all

      head :ok
    else
      current_user.followings.create!(user: user)

      head :ok
    end
  end
end
