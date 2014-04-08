require 'spec_helper'

describe TrucksController do
  describe "#index" do
    before do
      @current_trucks = 2.times.collect { FactoryGirl.create(:current_truck) }
      @inactive_trucks = 2.times.collect { FactoryGirl.create(:inactive_truck) }
    end

    it "responds with Truck.current" do
      get :index
      expect(assigns(:trucks)).to match_array(@current_trucks)
      @inactive_trucks.each do |inactive_truck|
        expect(assigns(:trucks)).not_to include(inactive_truck)
      end
    end
  end
end
