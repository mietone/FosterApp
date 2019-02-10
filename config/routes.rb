Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "auth_callbacks" }

  root 'litters#index'
  get 'litters/:litter_id/kittens/:id/next', to: 'kittens#next'
  get 'litters/:litter_id/kittens/:id/prev', to: 'kittens#prev'

  resources :litters do
    collection do
      get :my_litters
      get :with_mom
    end
    resources :kittens
  end

end
