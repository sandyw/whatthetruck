class Location < ActiveRecord::Base
  belongs_to :truck

  validates :truck, :latitude, :longitude, :user_address, :geocoded_address, :from, :to, presence: true

  geocoded_by :user_address do |location, results|
    if result = results.first
      location.latitude = result.latitude
      location.longitude = result.longitude
      location.geocoded_address = result.address
    end
  end

  scope :current, -> { where('`locations`.`from` <= ? AND `locations`.`to` >= ?', Time.zone.now, Time.zone.now) }
  scope :upcoming, -> { where('`locations`.`from` >= ? AND `locations`.`from` <= ?', Time.zone.now, Time.zone.now + 6.hours) }

  def geocode!
    geocode
    save!
  end
end
