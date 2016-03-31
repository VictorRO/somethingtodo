Rails.application.routes.draw do

  resources :todo_items, only: [:create, :index] do
    resource :finish, only: [:create]
  end

  root to: "todo_items#index"
end
