Rails.application.routes.draw do
  get 'homes/index'
  resources :to_dos
  devise_for :users
  root to:"homes#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
