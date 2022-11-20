Rails.application.routes.draw do
  resources :logs
  root "movies#index"

  resources :comments
  resources :movies
  resources :actors

  post 'approve', to: "comments#approve"
end
