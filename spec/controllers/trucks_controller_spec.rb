require 'spec_helper'

describe TrucksController do
  describe "#index" do
    before do
      @current_trucks = 2.times.collect { FactoryGirl.create(:current_truck) }
      @upcoming_trucks = 2.times.collect { FactoryGirl.create(:upcoming_truck) }
    end

    it "responds with current and upcoming trucks" do
      get :index
      expect(assigns(:current_trucks)).to eq(serialize_trucks(@current_trucks))
      expect(assigns(:upcoming_trucks)).to eq(serialize_trucks(@upcoming_trucks))
    end
  end
end
