Rails.application.routes.draw do
  root "static_pages#home"
  get 'users/:id', to: 'users#show'
  devise_for :users
  resources :users do
    resources :activies
    resources :plans
  end

  resources :posts, only: %i(index show create destroy) do
    resources :photos, only: %i(create)
    resources :likes, except: :index, shallow: true
    resources :comments, only: %i(index create destroy), shallow: true
  end

  # Avatar routes
  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background] })
  }, as: :avatar
end
