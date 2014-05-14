define ['backbone', 'views/truck_view'], (Backbone, TruckView) ->
  class TruckListView extends Backbone.View
    initialize: ->
      @addAll()

    addAll: ->
      @model.each (truck) =>
        view = new TruckView(model: truck)
        @$el.append(view.render().el)
