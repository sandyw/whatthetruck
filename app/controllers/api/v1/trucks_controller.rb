class Api::V1::TrucksController < ApplicationController
  respond_to :json

  def index
    respond_with Truck.all
  end
end
