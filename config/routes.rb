Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users
  authenticated :admin_user do

  end
  root to: 'home#index'
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
