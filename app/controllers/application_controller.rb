# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # See https://stackoverflow.com/a/42572759/4870465
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
