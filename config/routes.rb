Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  # Home
  root       to: 'home#index'
  get   "/", to: 'home#index', as: 'home'
  
  # Images
  resources :images
  get "/my",                to: "images#my"
  get "/add_from_bookmark", to: "images#add_from_bookmark"
  get "/tags/:tag",         to: "images#index",             as: 'tag'
  
  # Bookmarklet
  get "drp",            to: "statics#drp"
  get "tools",          to: "statics#tools",          as: 'tools'
  get "invalid_image",  to: "statics#invalid_image",  as: 'invalid_image'
  
end
