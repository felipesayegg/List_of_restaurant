class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
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

    @restaurant = Restaurant.find(params[:id])
  end



  def update
      @restaurant = Restaurant.find(params[:id])
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant), notice: 'Restaurante atualizado com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      Rails.logger.debug "Restaurant destroyed successfully" if @restaurant.destroyed?
      redirect_to restaurants_path, notice: 'Restaurante excluído com sucesso.'
    end

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
