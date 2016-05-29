Rails.application.routes.draw do

  get 'software/new'

  get 'users/new'

  get 'users/new'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' =>'static_pages#about'

  get 'software' => 'static_pages#software'

  get 'contact' => 'messages#contact'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :messages, only: [:contact, :create]

  resources :compositions

  resources :users

end
