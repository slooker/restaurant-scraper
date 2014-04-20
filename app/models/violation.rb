class Violation < ActiveRecord::Base
  has_and_belongs_to_many :inspection
#   attr_accessible :code, :demerits, :description
end
