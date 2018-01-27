Rails.application.routes.draw do
  resources :posts
  root to: "sessoes#new"
  
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'logout', to: "sessoes#destroy", as: :logout

  resources :usuarios
end
