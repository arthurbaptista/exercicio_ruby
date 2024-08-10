Rails.application.routes.draw do
  resources :cities, only: [:index]
  root 'cities#search' 
end
