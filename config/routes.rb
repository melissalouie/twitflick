Rails.application.routes.draw do
  root 'welcome#index'

  resources :tv_shows do
    resources :tv_show_reviews
  end

  resources :genres, only: :show

  resources :users do
    resources :follows
  end

  get 'users/:id/add_like' => 'users#add_like', :as => 'add_like'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'

end
