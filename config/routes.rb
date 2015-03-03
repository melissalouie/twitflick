Rails.application.routes.draw do
  root 'welcome#index'

  resources :tv_shows do
    resources :tv_show_reviews
  end

  resources :users

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'

end
