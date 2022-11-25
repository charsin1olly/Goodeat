Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :foods do
    member do
      get :buy
    end
  end

end
