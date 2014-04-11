require 'spec_helper'

describe Location do
  it { should belong_to :truck }
  it { should validate_presence_of :truck }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :user_address }
  it { should validate_presence_of :geocoded_address }
  it { should validate_presence_of :from }
  it { should validate_presence_of :to }

  describe "::current" do
    before do
      @current = 2.times.collect { FactoryGirl.create(:current_location) }
      @past = 2.times.collect { FactoryGirl.create(:past_location) }
      @future = 2.times.collect { FactoryGirl.create(:future_location) }
    end

    it "returns locations which start before now and end after now" do
      expect(Location.current).to match_array(@current)
    end
  end

  describe "::upcoming" do
    before do
      @current = FactoryGirl.create(:current_location)
      @one_hour_upcoming = FactoryGirl.create(:future_location, from: 1.hour.from_now, to: 12.hours.from_now)
      @six_hours_upcoming = FactoryGirl.create(:future_location, from: 6.hours.from_now, to: 24.hours.from_now)
      @seven_hours_upcoming = FactoryGirl.create(:future_location, from: 7.hours.from_now, to: 12.hours.from_now)
    end

    it "returns locations which start after now up to 6 hours from now" do
      expect(Location.upcoming).to match_array([@one_hour_upcoming, @six_hours_upcoming])
    end
  end

  describe "geocode!" do
    let(:location) { FactoryGirl.create(:location, latitude: 0.0, longitude: 0.0, geocoded_address: 'blah') }

    it "geocodes and persists the location" do
      location.user_address = stubbed_user_address
      location.geocode!
      location.reload

      expect(location.latitude).to eq(123.0)
      expect(location.longitude).to eq(456.0)
      expect(location.geocoded_address).to eq(geocoded_address)
    end
  end

  describe "#hours" do
    it "is the hours of operation" do
      @location = Location.new from: 1.hour.ago, to: 2.hours.from_now
      time = "#{@location.from.strftime("%l%P")}-#{@location.to.strftime("%l%P")}"

      expect(@location.hours).to eq(time)
    end

    it "is blank if I have no hours" do
      @location = Location.new
      expect(@location.hours).to eq("")
    end
  end
end
