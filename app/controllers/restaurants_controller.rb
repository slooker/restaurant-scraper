class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    ## We don't ever want to show all restaurants.
    #@restaurants = Restaurant.all
    @restaurants = Restaurant.first

    render json: @restaurants
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    restaurant = Restaurant.find(params[:id])

    render json: restaurant
  end

  def inspections
    restaurant = Restaurant.find(params[:id])
    inspections = restaurant.inspections

    render json: inspections
  end

  def violations 
    restaurant = Restaurant.find(params[:id])
    violations = restaurant.inspections.order('date desc').first.violations

    render json: violations
  end

  def get_restaurants_within_x
    ## Get restaurants within X distance
    #
    ## Need current lat/long and distance to look through
    #
    ## SQL 
    #
## Lat and Long is Zappos
#set @orig_lat=36.172315;
#set @orig_lon=-115.139412;
#
#SELECT name, address, current_grade,
#    SQRT(
#    POW(69.1 * (latitude - @orig_lat), 2) +
#        POW(69.1 * (@orig_lon - longitude) * COS(latitude / 57.3), 2)) AS distance
#        FROM restaurants HAVING distance < 1 ORDER BY distance;
#        desc restaurants;

  end


  # POST /restaurants
  # POST /restaurants.json
#  def create
#    @restaurant = Restaurant.new(params[:restaurant])
#
#    if @restaurant.save
#      render json: @restaurant, status: :created, location: @restaurant
#    else
#      render json: @restaurant.errors, status: :unprocessable_entity
#    end
#  end
  
  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
#  def update
#    @restaurant = Restaurant.find(params[:id])
#
#    if @restaurant.update(params[:restaurant])
#      head :no_content
#    else
#      render json: @restaurant.errors, status: :unprocessable_entity
#    end
#  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
#  def destroy
#    @restaurant = Restaurant.find(params[:id])
#    @restaurant.destroy
#
#    head :no_content
#  end

  ## Replaces attr_accessible
  private
  def app_params
    params.require(:permit_id, :permit_number, :name, :address, :latitude, :longitude, :city, :zip, :current_grade, :category, :current_inspection_type, :demerits)
      .permit(:permit_id, :permit_number, :name, :address, :latitude, :longitude, :city, :zip, :current_grade, :category, :current_inspection_type, :demerits)
  end
  
end
