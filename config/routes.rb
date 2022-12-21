Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :create] do
   member do
    get :followings
    get :followers
    end
  end

 resources :microposts, only: [:index,:create, :destroy] 
 post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
 delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
 
 resources :relationships, only: [:create, :destroy]
end
