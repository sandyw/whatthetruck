define ['backbone', 'models/truck'], (Backbone, Truck) ->
  class TruckList extends Backbone.Collection
    model: Truck
