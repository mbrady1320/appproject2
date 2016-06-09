Rails.application.routes.draw do
  resources :products
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#index'
  
  post 'static_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

end
