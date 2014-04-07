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
  tagName: 'li',

  template: _.template "<li><%= name %></li>"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

app.TruckListView = Backbone.View.extend
  el: '#list'

  initialize: ->
    @addAll()

  addAll: ->
    app.trucks.each (truck) =>
      view = new app.TruckListItemView(model: truck)
      @$el.append(view.render().el)

$ ->
  new app.TruckListView()
