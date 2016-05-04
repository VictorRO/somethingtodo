Rails.application.routes.draw do

  resources :tasks, only: [:create, :index, :update] do
    resource :finish, only: [:create]
  end

  root to: "tasks#index"
end
