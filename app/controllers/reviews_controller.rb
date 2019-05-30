class ReviewsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`

  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = @restaurant
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
    render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
