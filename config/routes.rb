Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }
  
  # Home
  get   '/',                to: 'home#index',               as: 'home'
  
  # Images
  resources :images
  get '/my',                to: 'images#my',                as: 'my'
  get '/add_from_bookmark', to: 'images#add_from_bookmark', as: 'add_from_bookmark'
  get '/tags/:tag',         to: 'images#index',             as: 'tag'
  
  # Bookmarklet
  get 'tools',              to: 'statics#tools',            as: 'tools'
  get 'bookmarklet',        to: 'statics#bookmarklet',      as: 'bookmarklet'
  get 'invalid_image',      to: 'statics#invalid_image',    as: 'invalid_image'
  
  # Root
  root to: 'home#index'
  
end
