Rails.application.routes.draw do
  resources :products
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#index'


  resources :orders, only: [:index, :show, :create, :destroy]

end
