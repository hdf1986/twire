# frozen_string_literal: true

class SignedInApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :fetch_recommended_users

  private

  def fetch_recommended_users
    @recommended_users = User.all.where.not(id: current_user.followed.ids + [current_user.id])
  end
end
