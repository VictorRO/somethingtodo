Rails.application.routes.draw do

  get 'sessions/new'

  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  constraints subdomain: 'app' do
    resources :tasks, only: [:create, :index, :update] do
      resource :finish, only: [:create]
    end

    root 'tasks#index', as: :app_root
  end

  resources :users, only: [:create]

  root 'static_pages#home'
end
