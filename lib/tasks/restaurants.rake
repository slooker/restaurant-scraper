require 'net/http'
require 'uri'
require 'json'
require 'pp'

namespace :restaurants do
  desc "Get all restaurants and map them to inspections"

  task :get_all => :environment do 
    get_all_restaurants
  end
end

def get_all_restaurants 
  total = 1
  limit = 500 ## Normally its 500
#  limit = 1   ## Normally its 500
  base_url = "http://www.southernnevadahealthdistrict.org/restaurants/stores/restaurants.php?reload=true&category_id=0&search_type=contains&restaurant_hotel=&restaurant_name=&restaurant_address=&current_grade=Z&restaurant_city=0&restaurant_zipcode=&limit=#{limit}"
  start = 0
  @increment = 500
  #@increment = 5
  i = 0;
  
  total_runs = 1 
  
  while i < total_runs 
    start = i * @increment
    i += 1
  
    ## Generate the URL
    current_url = "#{base_url}&start=#{start}"
    #puts current_url
    #puts "start: #{start}, i: #{i}, total: #{total_runs}"
  
    ## Fetch the data
    jsonish = fetch_url(current_url)

    ## Fix their json and get a json object back
    realJson = get_real_json(jsonish)
    #pp realJson

    if (total_runs == 1)
      ## Gets  actual total runs.  Uncomment this for live
      total_runs = get_total_runs(realJson['total'])
    end

    realJson['restaurants'].each do |r|
      rn = Restaurant.where(permit_id: r['permit_id']).first_or_create
      pp rn
      rn.update_attributes!(
        #:permit_id => r['permit_id'],
        :permit_number => r['permit_number'],
        :name => r['restaurant_name'],
        :address => r['address'],
        :latitude => r['latitude'],
        :longitude => r['longitude'],
        :city => r['city_name'],
        :zip => r['zip_code'],
        #:current_grade => r['current_grade'],
        :category => r['category_name'],
        #:current_inspection_type => r['insp_type'],
        #:current_inspection_date => r['date_current'],
        #:demerits => r['demerits']
      )

      old_inspection = false
      r['prev_insp'].each do |i|
        if !Inspection.where(inspection_id: i['inspection_id']).first
          #puts "Name: #{insp.class.name}"
          insp = Inspection.create(
            inspection_id: i['inspection_id'],
            permit_number: i['permit_id'],
            date: i['inspection_date'],
            demerits: i['inspection_demerits'],
            grade: i['inspection_grade'],
            inspection_type: i['inspection_type'],
            permit_status: i['permit_status']
          )

          if i['violations'] and !old_inspection
            vArray = i['violations'].split(',')
            #puts "looping over violations"
            vArray.each do |vi|
              #puts "Violation id: #{vi}"
              v = Violation.find_by_id(vi)
              #pp v
              insp.violations << v
            end
            insp.save
            rn.inspections << insp
          end
        end
        rn.save
        #pp rn.inspections.order('date desc').first
#        pp rn
      end
    end
  end
end

def get_total_runs(total) 
  total_runs = ((total - total % @increment) / @increment)
  total_runs += total % @increment ? 1 : 0 
  ## Should be 31 runs, total (Based on 15480)
  puts "Total runs = #{total_runs}"
  return total_runs
end

def fetch_url(url) 
  uri = URI.parse(url)
  response = Net::HTTP.get_response uri
  return response.body
end

def get_real_json(json_string) 
  ## Fix their screwed up 'json'
  json_string["total:"]= "\"total\":"
  json_string["restaurants:"]= "\"restaurants\":"
  json_string["\\"] = ""

  return JSON.parse(json_string)
end
