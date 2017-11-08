class HomeController < ApplicationController
 helper :all

  def index
  	redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
  	@transfers = Transfer.all
  	@inventories = Inventory.all
  	@customer_details = CustomerDetail.all
  end
end
