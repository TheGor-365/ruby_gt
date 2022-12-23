Rails.application.routes.draw do
  resources :langs
  resources :guide_code_langs
  root 'pages#home', as: 'home'

  resources :rails_guides

  resources :guide_codes
  resources :guides
  resources :tags
  resources :languages
  resources :snippets
end
