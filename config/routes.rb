Rails.application.routes.draw do

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
  # random addpoints function
  get 'random/addpoints'
  post 'random/addpoints'

  # post method for accept
  post 'random/accept'

  get  '/signup',  to: 'users#new'

  post '/signup',  to: 'users#create'

  get 'users/login'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'geomap/index'
  get 'geomap/directions'

  root  'random#index'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :reviews,          only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
