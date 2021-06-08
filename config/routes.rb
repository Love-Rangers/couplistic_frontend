Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :dashboard, only: :index


  # resources :lovers, only: :index
  # resource :spotify, only: :new, controller: 'spotify'
  # resources :sessions, only: :new
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
  #
  # #catch all for rogue uri's
  # get '*pages', to: 'welcome#index'
end
