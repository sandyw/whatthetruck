define ['backbone', 'views/truck_view', 'views/truck_map_pin_view'], (Backbone, TruckView, TruckMapPinView) ->
  class TruckListView extends Backbone.View
    initialize: ->
      @addAll()

    addAll: ->
      @model.each (truck) =>
        view = new TruckView(model: truck)
        @$el.append(view.render().el)
        if truck.get('latitude')? && truck.get('longitude')?
          new TruckMapPinView(model: truck).render()
