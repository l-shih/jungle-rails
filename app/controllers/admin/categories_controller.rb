class Admin::CategoriesController < ApplicationController
  name = ENV["ADMIN_USER"]
  password = ENV["ADMIN_PASSWORD"]

  http_basic_authenticate_with name: name, password: password

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: "Category deleted!"
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render 'new'
    end

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
