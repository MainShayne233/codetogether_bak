Rails.application.routes.draw do

  devise_for :users
  root 'coderooms#index'

  resources :coderooms

end
