class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @review = Review.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find params[:id]
  end

end
