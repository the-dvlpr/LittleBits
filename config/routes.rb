Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users

  resources :inventions

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
