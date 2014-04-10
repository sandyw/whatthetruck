class TrucksController < ApplicationController
  respond_to :html

  helper_method :current_trucks, :upcoming_trucks, :trucks_out_right_now?, :trucks_coming_up?

  def index
    current_trucks
    upcoming_trucks
  end

  private

  def current_trucks
    @current_trucks ||= ActiveModel::ArraySerializer.new(Truck.current, each_serializer: TruckSerializer).to_json
  end

  def upcoming_trucks
    @upcoming_trucks ||= ActiveModel::ArraySerializer.new(Truck.upcoming, each_serializer: TruckSerializer).to_json
  end

  def trucks_out_right_now?
    Truck.current.present?
  end

  def trucks_coming_up?
    Truck.upcoming.present?
  end
end
