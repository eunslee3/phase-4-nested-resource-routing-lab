Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show, :index, :create]

  get '/users/:id/items', to: 'users#index_items'
  get '/users/:user_id/items/:item_id', to: 'users#show_item'
  post '/users/:user_id/items', to: 'users#create_user_items'
end
