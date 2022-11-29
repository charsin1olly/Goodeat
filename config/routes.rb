Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :foods do
    member do
      get :buy
    end
    resources :comments ,only: [:create ,:destroy] ,shallow: true
  end

end
