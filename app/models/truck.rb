class Truck < ActiveRecord::Base
  validates :name, presence: true
  has_many :locations, dependent: :destroy

  delegate :latitude, :longitude, to: :current_location, allow_nil: true
  delegate :geocoded_address, to: :next_location

  scope :current, -> { joins(:locations).merge(Location.current) }
  scope :upcoming, -> { joins(:locations).merge(Location.upcoming) }

  def current_location
    locations.current.first
  end

  def add_location!(address: nil, from: nil, to: nil)
    location = locations.build user_address: address, from: from, to: to
    location.geocode!
  end

  def hours
    next_location.hours
  end

  def next_location
    if locations.present?
      locations.order('`locations`.`from` ASC').where('`locations`.`to` >= ?', Time.zone.now).first
    else
      Location.new
    end
  end
end
