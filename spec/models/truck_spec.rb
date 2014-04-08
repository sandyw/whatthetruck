require 'spec_helper'

describe Truck do
  it { should validate_presence_of :name }

  describe "#update_location" do
    let(:truck) { FactoryGirl.create(:truck) }
    let(:user_address) { "1022 park st 32204" }
    before do
      truck.update_location(user_address)
      truck.reload
    end

    it "sets the truck's user_address" do
      expect(truck.user_address).to eq(user_address)
    end

    it "sets the truck's lat/long" do
      expect(truck.latitude).to eq(123.0)
      expect(truck.longitude).to eq(456.0)
    end

    it "sets the truck's geocoded_address to the full address returned by google" do
      expect(truck.geocoded_address).to eq("1022 Park St., Jacksonville, FL, 32204, USA")
    end
  end

  describe "::current" do
    it "returns trucks which have a latitude and longitude set" do
      @current_trucks  = 2.times.collect { FactoryGirl.create(:current_truck) }
      @inactive_trucks = 2.times.collect { FactoryGirl.create(:inactive_truck) }
      expect(Truck.current).to match_array(@current_trucks)
    end

    it "does not include trucks with only latitude or longitude" do
      FactoryGirl.create(:current_truck, longitude: nil)
      FactoryGirl.create(:current_truck, latitude: nil)
      expect(Truck.current).to be_empty
    end
  end
end
