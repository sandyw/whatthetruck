class TrucksController < ApplicationController
  respond_to :html

  def index
    respond_with @trucks = Truck.all
  end
end
