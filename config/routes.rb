Rails.application.routes.draw do
  
  resources :customer_details do
    collection do 
      get :existing_customer, :search_customer
    end
    
    member do
       get :customer_receipt, :show_engineer_copy, :inventory_item, :inventory
     end
     resources :inventory_items
  end

   resources :inventory_items do
    collection do 
      get :select_inventory,:select
    end
    member do
      get :add_product_existing_customer, :show_invoice
    end
  end


  resources :engineer_details 

  resources :inventories do
    collection do
    post :import
    get  :load_item_data
  end
  member do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
