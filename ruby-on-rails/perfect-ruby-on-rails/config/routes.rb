# frozen_string_literal: true

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Used by kamal-proxy for zero-downtime deploy health checks.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root   'events#index'
  get    '/status'                  => 'status#index', defaults: { format: :json }
  get    '/auth/:provider/callback' => 'sessions#create'
  delete '/logout'                  => 'sessions#destroy'

  resources :events do
    resources :tickets, only: %i[new create destroy]
  end

  resource :retirements, only: %i[new create]
end
