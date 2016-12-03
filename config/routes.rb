Rails.application.routes.draw do

  get 'search/result'
  get 'search/index'

  # facebook login
  match '/auth/:provider/callback', to: 'sessions#create_facebook', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]

  get   'static_pages/home'
  get   'static_pages/about'


  get 'sessions/new'
  get 'random/index'
  get 'random/search'
  post 'random/search'

  get 'random/accept'
  get 'random/success'
  get 'random/leaderboard'
  # random addpoints function
  get 'random/addpoints'
  post 'random/addpoints'

  get 'random/reviews'
  # post method for accept
  post 'random/accept'

  get  '/signup',  to: 'users#new'

  post '/signup',  to: 'users#create'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root  'random#index'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :reviews,          only: [:create, :destroy]
  resources :locations,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
