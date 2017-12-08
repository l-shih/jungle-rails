class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  before_filter :authorize, only: [:create]

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.product_id = @product.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to @product, notice: 'Thanks for leaving a review!'
    else
      redirect_to @product, notice: "Your review didn't go through, please make sure you entered a rating and description"
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.product, notice: 'Your review has been deleted'
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :description, :product, :user)
    end

end
