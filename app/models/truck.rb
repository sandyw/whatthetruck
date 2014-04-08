class Truck < ActiveRecord::Base
  validates :name, presence: true

  geocoded_by :address
  scope :current, -> { where.not(latitude: nil, longitude: nil) }

  def update_location(address)
    self.address = address
    geocode
    save!
  end
end
