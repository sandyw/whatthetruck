require 'spec_helper'

describe Api::V1::TrucksController do
  describe "GET #index" do
    before { 2.times.collect { FactoryGirl.create(:truck) } }

    it "returns a JSON list of all trucks" do
      get :index, format: :json
      trucks = JSON.parse(Truck.all.to_json(only: [ :id, :latitude, :longitude, :name ]))
      response = JSON.parse(@response.body)
      expect(response['trucks']).to eq(trucks)
    end
  end
end
