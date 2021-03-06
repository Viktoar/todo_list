Rails.application.routes.draw do
  # get 'users/new'
  resources :users
  resources :lists do
    resources :tasks do
      collection { post :sort}
    end
  end
  root 'lists#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
