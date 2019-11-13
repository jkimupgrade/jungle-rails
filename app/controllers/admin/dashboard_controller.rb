class Admin::DashboardController < ApplicationController
  def show
    @categories = Category
    @products = Product
  end
end
