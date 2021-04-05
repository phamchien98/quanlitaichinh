Rails.application.routes.draw do
  root "static_pages#home"
  get 'home', to: 'users#home'
  devise_for :users
  resources :users do
    resources :activies
    resources :plans
  end

  resources :posts, only: %i(index show create) do
    resources :photos, only: [:create]
  end 
end
