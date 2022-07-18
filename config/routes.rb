# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do 
    resources :contents, only: [:index]
    root 'contents#index'
  end

  unauthenticated do
    root 'static#landing', as: :landing
  end
end
