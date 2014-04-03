google.maps.event.addDomListener window, 'load', ->
  mapOptions = { center: new google.maps.LatLng(30.3369, -81.6614), zoom: 8 }
  new google.maps.Map(document.getElementById("map"), mapOptions)
