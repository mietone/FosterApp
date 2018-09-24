Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "auth_callbacks" }

  resources :litters do
    resources :kittens
  end

  root 'litters#index'
end
