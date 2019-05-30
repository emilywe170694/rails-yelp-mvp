class RestaurantsController < ApplicationController

  def index
  @restaurants = Restaurant.all      # GET /restaurants
  end

  def show
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new     # GET /restaurants/:id
  end

  def new
  @restaurant = Restaurant.new # GET /restaurants/new
  end

  def create        # POST /restaurants
    @restaurant = Restaurant.new(restaurant_params)
       # Unless @restaurant.valid?, #save will return false,
       # and @restaurant is not persisted.
       # TODO: present the form again with error messages.
      if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      else
      render :new
    end
  end


private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
