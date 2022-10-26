Rails.application.routes.draw do
  resources :rails_guides
  root 'pages#home', as: 'home'
end
