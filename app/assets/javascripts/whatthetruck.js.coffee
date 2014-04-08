window.app = {}

app.Truck = Backbone.Model.extend
  defaults:
    id: '',
    name: '',
    latitude: '',
    longitude: ''

app.TruckList = Backbone.Collection.extend
  model: app.Truck,
  url: '/api/v1/trucks'

app.TruckListItemView = Backbone.View.extend
  tagName: 'a',
  className: 'list-group-item',

  template: _.template "<h4 class='list-group-item-heading'><%= name %></h4>"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

app.TruckMapPinView = Backbone.View.extend
  render: ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng(@model.get('latitude'), @model.get('longitude')),
      map: app.map,
      title: @model.get('name')


app.TruckListView = Backbone.View.extend
  el: '#list'

  initialize: ->
    @addAll()

  addAll: ->
    app.trucks.each (truck) =>
      view = new app.TruckListItemView(model: truck)
      @$el.append(view.render().el)
      new app.TruckMapPinView(model: truck).render()

$ ->
  mapOptions = { center: new google.maps.LatLng(30.3369, -81.6614), zoom: 12 }
  app.map = new google.maps.Map(document.getElementById("map"), mapOptions)
  new app.TruckListView()
