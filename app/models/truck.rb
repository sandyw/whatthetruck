class Truck < ActiveRecord::Base
  validates :name, presence: true

  geocoded_by :user_address do |truck, results|
    if result = results.first
      truck.geocoded_address = results.first.address
      truck.latitude = result.latitude
      truck.longitude = result.longitude
    end
  end

  scope :current, -> { where.not(latitude: nil, longitude: nil) }

  def update_location(user_address)
    self.user_address = user_address
    geocode
    save!
  end
end
