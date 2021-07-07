Rails.application.routes.draw do
  get 'rooms/show'
  get 'rooms/index'
  root "users#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
