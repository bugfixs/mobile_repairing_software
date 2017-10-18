Rails.application.routes.draw do
  resources :employees
  resources :employee_types
  resources :general_settings
  resources :home do
  	collection do
  		get :dashboard
  		end
  	end
  get 'home/index'
  
	devise_scope :user do
      root to: "devise/sessions#new"
    end
	  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
