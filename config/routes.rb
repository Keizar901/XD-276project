Rails.application.routes.draw do
  get 'random/index'

  # get 'user/index'

  # get 'user/show'

  # get 'user/new'

  # get 'user/create'

  # get 'user/edit'

  # get 'user/update'

  # get 'user/delete'

  # get 'user/destroy'
  resources :users
  get 'users/login'

  get 'geomaps/index'
  get 'geomaps/directions'
  root 'geomaps#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
