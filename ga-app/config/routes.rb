Rails.application.routes.draw do

  resources :users, only: [:show] do
    resources :events, except: [:index, :show]
  end

  resources :events, only: [:index, :show]

end

