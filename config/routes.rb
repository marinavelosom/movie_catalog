Rails.application.routes.draw do
  root "movies#index"

  resources :comments
  resources :movies
  resources :actors

  post 'approve', to: "comments#approve"
end
