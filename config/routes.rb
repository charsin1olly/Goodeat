Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users,controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :foods do
    member do
      get :buy
    end
    resources :comments ,only: [:create ,:destroy] ,shallow: true
  end

end
