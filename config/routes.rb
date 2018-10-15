Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "auth_callbacks" }

  root 'litters#index'

  resources :litters do
    collection do
      get :my_litters
      get :with_mom
    end
    resources :kittens
  end

end
