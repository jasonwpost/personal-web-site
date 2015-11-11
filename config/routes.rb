Rails.application.routes.draw do
  resources :messages, only: [:contact, :create]

  get 'users/new'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' =>'static_pages#about'

  get 'software' => 'static_pages#software'

  get 'contact' => 'messages#contact'

end
