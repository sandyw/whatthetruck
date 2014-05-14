define ['backbone', 'templates/trucks/list_item_view'], (Backbone, template) ->
  class TruckView extends Backbone.View
    events: { 'click': 'toggleInfoWindow' },
    tagName: "div",
    className: "list-group-item",
    template: JST['trucks/list_item_view']

    initialize: ->
      @infoWindowOpen = false

    infoWindow: ->
      @_infoWindow ||= new google.maps.InfoWindow
        content: @model.get('name')

    marker: ->
      @_marker ||= new google.maps.Marker
        position: new google.maps.LatLng(@model.get("latitude"), @model.get("longitude")),
        map: app.map,
        icon: 'assets/pin_active.png',
        title: @model.get('name')

    toggleInfoWindow: ->
      if @infoWindowOpen
        @infoWindowOpen = false
        @infoWindow().close()
      else
        @infoWindowOpen = true
        @infoWindow().open(app.map, @marker())

    render: ->
      @$el.html(@template(@model.toJSON()))
      @marker()
      @
