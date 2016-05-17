Rails.application.routes.draw do
  resources :products
  
  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'static_pages/index'

  root 'static_pages#landing_page'


  resources :orders, only: [:index, :show, :create, :destroy]

end
