Rails.application.routes.draw do
  resources :general_settings
  resources :home
  get 'home/index'
	root 'home#index'
	  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
