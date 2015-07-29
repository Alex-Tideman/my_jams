Rails.application.routes.draw do
 resources :songs
 resources :users, only: [:new, :create, :show]
 root to: "songs#index"
 get '/login', to: "sessions#new"
 post '/login', to: "sessions#create"
 delete '/logout', to: "sessions#destroy", as: "logout"
 get '/no_track', to: "songs#no_track"
end
