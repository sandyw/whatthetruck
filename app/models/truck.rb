class Truck < ActiveRecord::Base
  validates :name, :latitude, :longitude, :address, presence: true

  geocoded_by :address

  def update_location(address)
    self.address = address
    geocode
    save!
  end
end
