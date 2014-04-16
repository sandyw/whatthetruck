#= require hamlcoffee
#= require jquery
window.app = {}
$ ->
  mapOptions = { center: new google.maps.LatLng(30.3369, -81.6614), zoom: 12 }
  app.map = new google.maps.Map(document.getElementById("map"), mapOptions)
  require ['views/truck_list_view'], (TruckListView) ->
    if app.trucks
      new TruckListView(model: app.trucks, el: "#list")
    if app.upcomingTrucks
      new TruckListView(model: app.upcomingTrucks, el: "#upcoming")
