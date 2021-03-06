Rails.application.routes.draw do
  root to: "pages#show"

  get "/pages", to: "pages#show"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/users/:id/edit", to: "users#edit"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy" 
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/profiles/new", to: "profiles#new"
  post "/profiles", to: "profiles#create"
  get "/profiles/:id", to: "profiles#show"
  get "/profiles/:id/edit", to: "profiles#edit"
  patch "/profiles/:id", to: "profiles#update"
  patch "/profiles/:id/pic", to: "profiles#change_pic"
  delete "/profiles/:id", to: "profiles#destroy"

  get "/trips", to: "trips#index"
  get "/trips/new", to: "trips#new"
  post "/trips", to: "trips#create"
  get "/trips/:id", to: "trips#show"
  get "/trips/:id/edit", to: "trips#edit"
  patch "/trips/:id", to: "trips#update"
  delete "/trips/:id", to: "trips#destroy"

  post "/favorites", to: "favorites#create"
  delete "/favorites/:id", to: "favorites#destroy"

  post "/friendships", to: "friendships#create"
  delete "/friendships/:id", to: "friendships#destroy"

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
    member do
      post :restore
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

end
