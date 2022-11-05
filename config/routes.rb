Rails.application.routes.draw do
  root 'pages#home', as: 'home'

  resources :rails_guides

  resources :tags
  resources :languages
  resources :snippets
end
