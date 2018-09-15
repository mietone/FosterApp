Rails.application.routes.draw do
  devise_for :users

  resources :litters
  
  root 'litters#index'
end
