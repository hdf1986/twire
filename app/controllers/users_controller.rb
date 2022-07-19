# frozen_string_literal: true

class UsersController < SignedInApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find_by_nickname!(params[:nickname])
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(permitted_params)
      redirect_to edit_user_path(@user), notice: 'User has been updated succesfully!'
    else
      render 'users/edit', status: :unprocessable_entity
    end
  end

  def follow
    user = User.find_by_nickname(params[:user_nickname])

    if current_user.follows?(user.id)
      current_user.followings.where(user: user).destroy_all
    else
      current_user.followings.create!(user: user)
    end
    redirect_to user
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def permitted_params
    params.require(:user).permit(:nickname)
  end
end
