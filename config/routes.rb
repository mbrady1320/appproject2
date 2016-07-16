Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registrations" }
  
  resources :products do
    resources :comments
  end
  resources :users

  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#index'
  
  post 'static_pages/thank_you'
  
  resources :orders, only: [:index, :show, :create, :destroy]
  
  
  
end
