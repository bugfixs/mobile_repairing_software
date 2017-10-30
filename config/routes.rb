Rails.application.routes.draw do
  resources :inventories do
    collection do
      post :import
      get :search
    end
  end
  resources :inventory_types
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

  resources :inventory_transfers do
    collection do
      get :select
      get :assign_all
      get :remove_all
      get :inventory_transfer
    end
    member do
      get :transfer
    end
  end

  resources :reports do 
    collection do
    get :select, :report, :transfer
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
