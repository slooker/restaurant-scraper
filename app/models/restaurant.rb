class Restaurant < ActiveRecord::Base
  # attr_accessible :title, :body
#  has_many :violations
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude

  has_many :inspections

#  attr_accessible :permit_id, :permit_number, :name, :address, :latitude, :longitude, :city, :zip, :current_grade, :category, :current_inspection_type, :demerits

end
