Floodlight::Engine.routes.draw do
  namespace :api do
    resources :health_check, only: [:index]
    resources :metrics, only: [:index]
    resources :statistics, only: [:show]
  end
end
