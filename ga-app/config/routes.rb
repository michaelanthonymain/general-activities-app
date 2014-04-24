Rails.application.routes.draw do

  resources :users, only: [:show] do
    resources :events, except: [:index, :show]
  end

  resources :events, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end

  resources :attendances, only: [:create, :destroy]


end

