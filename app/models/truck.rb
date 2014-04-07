class Truck < ActiveRecord::Base
  validates :name, :latitude, :longitude, :address, presence: true
end
