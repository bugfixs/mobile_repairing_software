class HomeController < ApplicationController
 helper :all

  def index
  	redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
  	
  end
end
