require 'spec_helper'

describe Truck do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }

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
  end
end
