Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  resources :categories do 
    resources :purchases
  end

  get '/categories/:category_id/purchases/', to: 'purchases#index', as: 'category_purchases_path'
end
