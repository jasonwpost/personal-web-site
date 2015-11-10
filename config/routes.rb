Rails.application.routes.draw do
  resources :messages, only: [:new, :create]

  get 'users/new'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' =>'static_pages#about'

  #get 'contact' => 'static_pages#contact'

  get 'software' => 'static_pages#software'

  get 'contact' => 'messages#new'

end
