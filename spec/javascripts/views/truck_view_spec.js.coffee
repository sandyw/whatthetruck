define ['models/truck', 'views/truck_view'], (Truck, TruckView) ->
  describe "TruckView", ->
    describe "view", ->
      beforeEach ->
        @view = new TruckView()

      it "uses an a element for its tag", ->
        expect(@view.tagName).toEqual("div")
        expect(@view.className).toEqual("list-group-item")

    describe "render", ->
      beforeEach ->
        fixture.set "<div id='list'></div>"
        window.app = {}
        window.app.map = {map: 'I am a map.'}
        @truck = new Truck({ name: "Truckee", geocoded_address: "1 Laurel Street", hours: "9am-5pm", latitude: 123.0, longitude: 456.0 })
        @view = new TruckView(model: @truck)
        $('#list').append(@view.render().el)

      it "renders its name, geocoded_address and hours", ->
        expect($('#list').text()).toContain("Truckee")
        expect($('#list').text()).toContain("1 Laurel Street")
        expect($('#list').text()).toContain("9am-5pm")

      it "adds a pin to the map", ->
        expect(@view.marker() instanceof google.maps.Marker).toBeTruthy()
        expect(@view.marker().position instanceof google.maps.LatLng).toBeTruthy()
        expect(@view.marker().position.latitude).toEqual(@truck.get('latitude'))
        expect(@view.marker().position.longitude).toEqual(@truck.get('longitude'))
        expect(@view.marker().map).toEqual(window.app.map)
        expect(@view.marker().title).toEqual(@truck.get('name'))
        expect(@view.marker().icon).toEqual('assets/pin_active.png')

    describe "toggleInfoWindow", ->
      beforeEach ->
        @view = new TruckView(model: new Truck({ name: "Truckee" })).render()

      it "shows the info window on click", ->
        spyOn(@view.infoWindow(), 'open')
        @view.$el.trigger('click')
        expect(@view.infoWindow().open).toHaveBeenCalledWith(app.map, @view.marker())

      it "closes the window if it is open", ->
        spyOn(@view.infoWindow(), 'close')
        @view.$el.trigger('click')
        expect(@view.infoWindow().close).not.toHaveBeenCalled()
        @view.$el.trigger('click')
        expect(@view.infoWindow().close).toHaveBeenCalled()

    describe "infoWindow", ->
      beforeEach ->
        @truck = new Truck({ name: "Truckee" })
        @view = new TruckView(model: @truck)

      it "is a google maps info window", ->
        expect(@view.infoWindow() instanceof google.maps.InfoWindow).toBeTruthy()

      it "contains the truck's name in its content", ->
        expect(@view.infoWindow().content).toEqual(@truck.get('name'))
