Rails.application.routes.draw do
  get 'home', to: 'users#home'
  devise_for :users
  root "static_pages#home"
  resources :users do
    resources :activies
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
