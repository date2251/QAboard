Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

	get 'search', to: 'toppages#search'

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	get 'signup', to: 'users#new'
	resources :users, only: [:show, :new, :create] do
		member do
			get :answers
			get :likes
			get :favorites
		end
	end

	get 'questions/new', to: 'questions#new'
	resources :questions, only: [:show, :create]

	post 'questions/:id', to: 'answers#create'

	resources :goods, only: [:create, :destroy]

	resources :favorites, only: [:create, :destroy]
end
