window.app = {}

app.Truck = Backbone.Model.extend
  defaults:
    id: '',
    name: '',

app.TruckList = Backbone.Collection.extend
  model: app.Truck

app.TruckView = Backbone.View.extend
  tagName: "div",
  className: "list-group-item",

  template: JST['trucks/list_item_view']

  render: ->
    @$el.html(@template(@model.toJSON()))
    #@marker = new google.maps.Marker
    #  position: new google.maps.LatLng(@model.get("latitude"), @model.get("longitude"))

    @

app.TruckMapPinView = Backbone.View.extend
  render: ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng(@model.get("latitude"), @model.get("longitude")),
      map: app.map,
      icon: 'assets/pin_active.png'
      title: @model.get("name")

app.TruckListView = Backbone.View.extend
  initialize: ->
    @addAll()

  addAll: ->
    @model.each (truck) =>
      view = new app.TruckView(model: truck)
      @$el.append(view.render().el)
      if truck.get('latitude')? && truck.get('longitude')?
        new app.TruckMapPinView(model: truck).render()

$ ->
  if google?
    mapOptions = { center: new google.maps.LatLng(30.3369, -81.6614), zoom: 12 }
    app.map = new google.maps.Map(document.getElementById("map"), mapOptions)
    if app.trucks
      new app.TruckListView(model: app.trucks, el: "#list")
    if app.upcomingTrucks
      new app.TruckListView(model: app.upcomingTrucks, el: "#upcoming")
