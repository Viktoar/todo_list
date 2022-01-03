Rails.application.routes.draw do
  get 'users/new'
  resources :lists do
    resources :tasks do
      collection { post :sort}
    end
  end
  root 'lists#index'
  get 'static_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
