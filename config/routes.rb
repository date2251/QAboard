# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'search', to: 'toppages#search'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: %i[show new create] do
    member do
      get :answers
      get :likes
      get :favorites
    end
  end

  get 'questions/new', to: 'questions#new'
  resources :questions, only: %i[show create]

  post 'questions/:id', to: 'answers#create'

  resources :goods, only: %i[create destroy]

  resources :favorites, only: %i[create destroy]
end
