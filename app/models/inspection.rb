class Inspection < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :restaurant
  has_and_belongs_to_many :violations

#  attr_accessible :inspection_id, :permit_number, :date, :demerits, :grade, :inspection_type, :permit_status

end
