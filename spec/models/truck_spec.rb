require 'spec_helper'

describe Truck do
  it { should validate_presence_of :name }
  it { should have_many(:locations).dependent(:destroy) }

  describe "::current" do
    it "returns trucks which have a current location" do
      @current_trucks  = 2.times.collect { FactoryGirl.create(:current_truck) }
      @inactive_trucks = 2.times.collect { FactoryGirl.create(:inactive_truck) }
      expect(Truck.current).to match_array(@current_trucks)
    end
  end

  describe "::upcoming" do
    before do
      @upcoming = FactoryGirl.create :truck
      FactoryGirl.create(:location, truck: @upcoming, from: 1.hour.from_now, to: 3.hours.from_now)

      @current = FactoryGirl.create :truck
      FactoryGirl.create(:location, truck: @current, from: 1.hour.ago, to: 3.hours.from_now)
    end

    it "returns trucks which have a location coming up in the next 6 hours" do
      expect(Truck.upcoming).to match_array([@upcoming])
    end

    it "doesn't include current trucks" do
      expect(Truck.upcoming).not_to include(@current)
    end
  end

  describe "#latitude" do
    before do
      @truck = FactoryGirl.create(:current_truck)
    end

    it "delegates to the #current_location" do
      expect(@truck.latitude).to eq(@truck.current_location.latitude)
    end
  end

  describe "#longitude" do
    before do
      @truck = FactoryGirl.create(:current_truck)
    end

    it "delegates to the #current_location" do
      expect(@truck.longitude).to eq(@truck.current_location.longitude)
    end
  end

  describe "#geocoded_address" do
    before do
      @truck = FactoryGirl.create(:current_truck)
    end

    it "delegates to the #current_location" do
      expect(@truck.geocoded_address).to eq(@truck.current_location.geocoded_address)
    end
  end

  describe "#current_location" do
    before do
      @truck = FactoryGirl.create(:current_truck)
      FactoryGirl.create(:past_location, truck: @truck)
      FactoryGirl.create(:future_location, truck: @truck)
    end

    it "returns the first current location" do
      expect(@truck.current_location).to eq(@truck.locations.current.first)
    end
  end

  describe "#add_location!" do
    let(:truck) { FactoryGirl.create(:truck) }
    let(:address) { "1022 park st 32204" }
    let(:from) { 1.hour.ago }
    let(:to) { 5.hours.from_now }

    it "creates a location for this truck" do
      expect(truck.locations.count).to eq(0)
      truck.add_location! address: address, from: from, to: to
      truck.reload
      expect(truck.locations.count).to eq(1)
    end

    it "sets attributes on the location" do
      truck.add_location! address: address, from: from, to: to
      expect(truck.locations.first.user_address).to eq(address)
      expect(truck.locations.first.from).to eq(from)
      expect(truck.locations.first.to).to eq(to)
    end

    it "geocodes the location" do
      truck.add_location! address: address, from: from, to: to
      expect(truck.locations.first.latitude).to eq(123.0)
      expect(truck.locations.first.longitude).to eq(456.0)
    end
  end
end
