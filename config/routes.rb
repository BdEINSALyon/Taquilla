Rails.application.routes.draw do

  get 'carts/show'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  devise_for :admin_users
  authenticated :admin_user do
    namespace :admin do
      resources :events do
        resources :passes
      end
    end
  end
  root to: 'home#index'
  resources :events, only: :show do
    resource :cart, only: [:show, :update], defaults: {format: :json} do
      get '/buy', action: :buy, defaults: {format: :html}
      get '/answers', action: :answers, defaults: {format: :html}
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
