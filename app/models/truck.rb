class Truck < ActiveRecord::Base
  validates :name, presence: true
  has_many :locations, dependent: :destroy

  delegate :latitude, :longitude, :geocoded_address, to: :current_location, allow_nil: true

  scope :current, -> { joins(:locations).merge(Location.current) }
  scope :upcoming, -> { joins(:locations).merge(Location.upcoming) }

  def current_location
    locations.current.first
  end

  def add_location!(address: nil, from: nil, to: nil)
    location = locations.build user_address: address, from: from, to: to
    location.geocode!
  end
end
