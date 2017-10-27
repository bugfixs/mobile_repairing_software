Rails.application.routes.draw do
  
  resources :customer_details do
    
    member do
       get :customer_receipt
       get :show_engineer_copy
     end
  end

  resources :engineer_details 

  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :employees
  resources :employee_types
  resources :general_settings
 
  resources :home do
  	collection do
  		get :dashboard
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
