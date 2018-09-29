Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "auth_callbacks" }

  root 'litters#index'

  resources :litters do
    resources :kittens
  end

  get '/litters/:litter_id/kittens/new' => 'kittens#new', :as => 'kitten'
end
