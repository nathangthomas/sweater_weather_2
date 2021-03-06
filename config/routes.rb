Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :location, only: :index
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :road_trip, only: :create
      resources :gifs, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
    end
  end
end
