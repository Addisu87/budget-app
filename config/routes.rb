Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  resources :categories do 
    resources :purchases
  end
end
