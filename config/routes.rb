Rails.application.routes.draw do
  resources :songs
  resources :genres
  resources :artists, only: [:index, :show, :new, :create, :edit, :update]

end
