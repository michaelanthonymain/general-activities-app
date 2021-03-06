Rails.application.routes.draw do

  root 'events#index'

  resources :users, only: [:show, :new] do
    resources :events, except: [:index, :show]
  end

  resources :events, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end

  resources :attendances, only: [:create, :edit, :update, :destroy]


  get '/sessions/new', to: 'sessions#new'
  get '/sessions/signin', to: 'sessions#signin'
  get '/sessions/auth', to: 'sessions#auth'
  get '/sessions/logout', to: 'sessions#logout'

  post '/attendances/:id/edit', to: 'attendances#edit'
  patch '/attendances/:id/edit', to: 'attendances#update'


end
