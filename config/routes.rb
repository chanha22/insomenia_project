Rails.application.routes.draw do

  root "cafes#index"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  get 'users/profile'
  post 'users/profile'


  post 'cafes/create'

  post 'comment/create'

  get 'comment/delete'

  post 'posts/create'

  get 'post/new'

  get 'post/modify'

  post 'post/update'

  get 'post/delete'

  get 'post/list'

  get 'post/detail'

  resources :cafes do
    collection do
      get 'map'
    end
  end
  resources :posts
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
