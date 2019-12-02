Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  post '/vote', action: :vote , controller: :users
  get '/users/:user_id/user_votes', action: :user_votes, controller: :users
  post '/login',action: :login,  controller: :sessions
end
