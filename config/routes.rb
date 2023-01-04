Rails.application.routes.draw do
  root 'pages#home', as: 'home'

  resources :languages
  resources :tags
  resources :langs
  resources :guides
  resources :snippets
  resources :guide_codes
  resources :snippet_codes
end
