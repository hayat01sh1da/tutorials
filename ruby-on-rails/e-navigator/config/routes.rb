# frozen_string_literal: true

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Used by kamal-proxy for zero-downtime deploy health checks.
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    root 'users/sessions#new'
  end
  resources :users, only: %i[index show] do
    resources :interviews, except: [:show] do
      member do
        post 'approve'
      end
      collection do
        post 'select_approver'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
