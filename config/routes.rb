Rails.application.routes.draw do

  devise_for :users
  root 'coderooms#index'

  resources :coderooms

  resources :whiteboards do
    get '/run' => 'whiteboards#run'
    get '/clear' => 'whiteboards#clear'

  end

end
