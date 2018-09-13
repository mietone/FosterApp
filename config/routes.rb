Rails.application.routes.draw do
  devise_for :users
  root 'litters#index'
end
