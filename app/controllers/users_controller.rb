# frozen_string_literal: true

class UsersController < SignedInApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(permitted_params)
      redirect_to edit_user_path(current_user), notice: 'User has been updated succesfully!'
    else
      render 'users/edit'
    end
  end

  def follow
    user = User.find(params[:user_id])

    if current_user.follows?(user.id)
      current_user.followings.where(user: user).destroy_all
    else
      current_user.followings.create!(user: user)
    end
    redirect_to user
  end

  private

  def permitted_params
    params.require(:user).permit(:nickname)
  end
end
