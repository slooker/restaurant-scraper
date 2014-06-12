class RestaurantsController < ApplicationController
  require 'pp'
  require 'cgi'
  # GET /restaurants
  # GET /restaurants.json
  def index
    ## We don't ever want to show all restaurants.
    @restaurants = Restaurant.all.limit(20)
    #@restaurants = Restaurant.first

    render json: @restaurants
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    restaurant = Restaurant.find(params[:id])

    render json: restaurant
  end

  def get_categories 
    categories_ugly = Restaurant.select(:category).uniq
    categories = []
    categories_ugly.each do |c|
      categories << c.category
    end
    return categories
  end

  def categories 
    render json: get_categories
  end

  def all 
    restaurant = Restaurant.find(params[:id])
    inspection = restaurant.inspections.order('date desc').first
    if (inspection) 
      violations = []
      if (inspection.violations) 
        restaurant.inspections.order('date desc').first.violations = violations
      end
    end


    response = { :restaurant => restaurant, :current_inspection => inspection, :violations => violations }

    render json: response

    
  end

  def inspections
    restaurant = Restaurant.find(params[:id])
    inspections = restaurant.inspections.order('date desc')

    

    render json: inspections
  end

  def violations 
    restaurant = Restaurant.find(params[:id])
    violations = restaurant.inspections.order('date desc').first.violations

    render json: violations
  end

  def get_restaurants_within_x
    lat = params[:lat]
    long = params[:long]
    range = params[:range] || 1

    sql_params = [ lat, long ]

    #restaurants = Restaurant.within(1, :origin => [lat, long]).limit(50)
    #
    #pp Restaurant.distance_sql(:origin => [lat, long], units = default_units, formula = default_formula)
    if (params[:exclusions]) 
      exclusions_encoded = params[:exclusions].split(',')
      accepted_categories = get_categories
      exclusions = []

      exclusions_encoded.each do |e| 
        ep = CGI.unescapeHTML(e)
        if (accepted_categories.include? ep)
          exclusions << ep
        end
      end

      restaurants = Restaurant.within(1, :origin => [lat, long]).where('category not in (?)',exclusions).limit(50)

    else 
      restaurants = Restaurant.within(1, :origin => [lat, long]).limit(50)
    end


    render json: restaurants
  end

  ## Replaces attr_accessible
  private
  def app_params
    params.require(:permit_id, :permit_number, :name, :address, :latitude, :longitude, :city, :zip, :current_grade, :category, :current_inspection_type, :demerits)
      .permit(:permit_id, :permit_number, :name, :address, :latitude, :longitude, :city, :zip, :current_grade, :category, :current_inspection_type, :demerits)
  end
  
end
