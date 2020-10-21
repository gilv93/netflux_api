Rails.application.routes.draw do
  get '/movies/:category', to: 'movies#show'
  resources :movies
  root 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
