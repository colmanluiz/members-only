Rails.application.routes.draw do

  resources :users, only: %i[ index new create show ]
  resource :session
  resources :posts, only: %i[ index new create show ]

  root "posts#index"
end
