# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do 
    resources :messages, only: [:index, :new, :create]
    resources :users, only: [:show]
    root 'messages#index'
  end

  unauthenticated do
    root 'static#landing', as: :landing
  end
end
