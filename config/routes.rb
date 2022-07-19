# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :messages, only: [:index, :new, :create]
  resources :users, only: [:show] do
    patch :follow
  end
  authenticated :user do 
    root 'messages#index'
  end

  unauthenticated do
    root 'static#landing', as: :landing
  end
end
