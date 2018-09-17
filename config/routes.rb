Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'recipes#search'

  resources :recipes
  resources :recipe_types
  resources :cuisines
  
end
