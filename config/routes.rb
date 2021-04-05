Rails.application.routes.draw do
  devise_for :users
   root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
 end
  resources :users,only: [:show,:index,:edit,:update] do
     resource :relationships, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  post '/favorite/:id' => 'favorites#favorite', as: 'favorite'
  post '/cosplay_favorite/:id' => 'cosplay_favorites#favorite', as: 'cosplay_favorite'

end