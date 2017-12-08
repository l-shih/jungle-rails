class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.product_id = @product.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to @product, notice: 'Thanks for leaving a review!'
    else
      render @product
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :description, :product, :user)
    end

end
