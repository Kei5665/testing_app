Rails.application.routes.draw do
  root 'maps#index'
  resources :maps, only: %i[index new create]
end
