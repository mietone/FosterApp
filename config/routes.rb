Rails.application.routes.draw do
  devise_for :users

  resources :litters do
    resources :kittens
  end

  root 'litters#index'
end
