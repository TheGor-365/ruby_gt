Rails.application.routes.draw do
  root 'pages#home', as: 'home'

  resources :languages
  resources :tags
  resources :langs

  resources :guides
  resources :snippets
  resources :commands
  resources :tutorials
  resources :examples
  resources :templates

  resources :guide_codes
  resources :snippet_codes
  resources :command_codes
  resources :tutorial_codes
  resources :example_codes
  resources :template_codes
end
