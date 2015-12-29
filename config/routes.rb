Rails.application.routes.draw do

  get 'users/new'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' =>'static_pages#about'

  get 'compositions' => 'compositions#index'

  get 'software' => 'static_pages#software'

  get 'contact' => 'messages#contact'

  get '/compositons/:id' => 'compositions#show', as: :composition

  resources :messages, only: [:contact, :create]

end
