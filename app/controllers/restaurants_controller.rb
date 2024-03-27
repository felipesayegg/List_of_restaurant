class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      # the block create a new instance and if save will redirect to the new restaurant created.[
    else
    render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[id])
    if @restaurant.update
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status :unprocessable_entity
    end

  end

  def update
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
