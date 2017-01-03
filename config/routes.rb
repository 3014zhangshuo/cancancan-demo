Rails.application.routes.draw do
  root to: 'pages#index'
  resources :sessions, only: [:update]
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
