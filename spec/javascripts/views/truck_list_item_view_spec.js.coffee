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

      xit "adds a pin to the map", ->
        expect(@view.marker instanceof google.maps.Marker).toBeTruthy()
        expect(@view.marker.position.latitude).toEqual(@model.get('latitude'))
        expect(@view.marker.position.longitude).toEqual(@model.get('longitude'))
        expect(@view.marker.map).toEqual(window.app.map)
        expect(@view.marker.title).toEqual(@model.get('name'))
