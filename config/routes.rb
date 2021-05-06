Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users

  resources :users, only: %i(index show) do
    resources :receipts
    resources :activies
    resources :plans
    member do
      get :following, :followers
    end
  end

  resources :posts, only: %i(index show create destroy) do
    resources :photos, only: %i(create)
    resources :likes, except: :index, shallow: true
    resources :comments, only: %i(index create destroy), shallow: true
  end

  resources :relationships, only: [:create, :destroy]
  
  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background] })
  }, as: :avatar
end
