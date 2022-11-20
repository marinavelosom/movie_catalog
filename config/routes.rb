Rails.application.routes.draw do
  resources :comments
  resources :movies
  post 'approve', to: "comments#approve"
  root "movies#index"
end
