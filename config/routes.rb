Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
  	 collection do
      get 'todolist_search'
      get 'search'
    end
  	resources :tasks, only: [:create, :destroy]
  end
  post '/lists/:list_id/tasks/:id/toggle' => 'tasks#toggle'

end
