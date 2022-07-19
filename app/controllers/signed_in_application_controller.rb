# frozen_string_literal: true

class SignedInApplicationController < ActionController::Base
  before_action :authenticate_user!
end
