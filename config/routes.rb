Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }
  
  # Home
  get   '/',                  to: 'home#index',               as: 'home'
  
  # Images
  resources :images
  get   '/my',                to: 'images#my',                as: 'my'
  get   '/add_from_bookmark', to: 'images#add_from_bookmark', as: 'add_from_bookmark'
  get   '/invalid_image',     to: 'images#invalid_image',     as: 'invalid_image'
  get   '/tags/:tag',         to: 'images#index',             as: 'tag'
  post  '/search',            to: 'images#search',            as: 'search_index'
  
  # Bookmarklet
  get   '/bookmarklet',       to: 'bookmarklet#bookmarklet',  as: 'bookmarklet'
  
  # Root
  root to: 'home#index'
  
end
