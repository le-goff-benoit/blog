Rails.application.routes.draw do
  get 'home/index'
  get 'home/subscribe'

  resources :articles do
    resources :comments
  end
  
  resources :users

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
