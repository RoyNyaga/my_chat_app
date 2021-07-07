Rails.application.routes.draw do
  resources :messages
  get "/open_room/:user_id", to: "rooms#open_room", as: "open_room"
  resources :rooms
  get 'rooms/index'
  root "users#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
