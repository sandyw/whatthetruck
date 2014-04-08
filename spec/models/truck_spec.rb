require 'spec_helper'

describe Truck do
  it { should validate_presence_of :name }

  describe "#update_location" do
    let(:truck) { FactoryGirl.create(:truck) }
    let(:address) { "1022 park st 32204" }

    it "sets the truck's address and geocodes it" do
      truck.update_location(address)
      truck.reload
      expect(truck.address).to eq(address)
      expect(truck.latitude).to eq(123.0)
      expect(truck.longitude).to eq(456.0)
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
