Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"

  get "password", to: "passwords#edit"
  post "password", to: "passwords#update"

  get "password/reset", to: "password_rests#new"
  post "password/reset", to: "password_rests#create"

  get "sign_up", to: "registrations#new", as: :edit_password
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"
  delete "logout", to: "sessions#destroy"

  # get "/", to: "main#index"
  root to: "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
