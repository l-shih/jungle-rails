class Admin::DashboardController < ApplicationController
  name = ENV["ADMIN_USER"]
  password = ENV["ADMIN_PASSWORD"]

  http_basic_authenticate_with name: name, password: password
  
  def show
  end
end
