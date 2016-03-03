Rails.application.routes.draw do

  resources :todo_items, only: [:create, :index]

  root to: "todo_items#index"
end
