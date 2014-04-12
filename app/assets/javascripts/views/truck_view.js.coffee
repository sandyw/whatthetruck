define ['backbone', 'templates/trucks/list_item_view'], (Backbone, template) ->
  class TruckView extends Backbone.View
    tagName: "div",
    className: "list-group-item",

    template: JST['trucks/list_item_view']

    render: ->
      @$el.html(@template(@model.toJSON()))
      #@marker = new google.maps.Marker
      #  position: new google.maps.LatLng(@model.get("latitude"), @model.get("longitude"))

      @
