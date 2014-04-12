define ['backbone'], (Backbone) ->
  class TruckMapPinView extends Backbone.View
    render: ->
      marker = new google.maps.Marker
        position: new google.maps.LatLng(@model.get("latitude"), @model.get("longitude")),
        map: app.map,
        icon: 'assets/pin_active.png'
        title: @model.get("name")
