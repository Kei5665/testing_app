Rails.application.routes.draw do
  root 'scores#index'
  resources :maps, only: %i[index new create]
end
