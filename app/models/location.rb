class Location < ActiveRecord::Base
  belongs_to :truck

  before_validation :geocode

  validates :truck, :latitude, :longitude, :user_address, :geocoded_address, :from, :to, presence: true

  geocoded_by :user_address do |location, results|
    if result = results.first
      location.latitude = result.latitude
      location.longitude = result.longitude
      location.geocoded_address = result.address
    end
  end

  scope :current, -> { where('`locations`.`from` <= ? AND `locations`.`to` >= ?', Time.now, Time.now) }
  scope :upcoming, -> { where('`locations`.`from` >= ? AND `locations`.`from` <= ?', Time.now, Time.now + 6.hours) }

  def geocode!
    geocode
    save!
  end

  def hours
    if hours?
      "#{from.strftime("%l%P")}-#{to.strftime("%l%P")}"
    else
      ""
    end
  end

  private

  def hours?
    from && to
  end
end
