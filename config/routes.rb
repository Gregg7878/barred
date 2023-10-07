Rails.application.routes.draw do
  resources :organizers
  resources :customers

  # post "/signup", to: "organizers#create" 
  post "/signup", to: "customers#create" 
  get "/me", to: "organizers#show"
  get "/me", to: "customers#show"
  post "login", to:"customer_sessions#create" 
  delete "/logout", to: "customer_sessions#destroy" 
  post "loginOrganizer", to:"organizer_sessions#create"
  delete "/logoutOrganizer", to: "organizer_sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
