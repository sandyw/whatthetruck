describe "TruckListItemView", ->
  describe "view", ->
    beforeEach ->
      @view = new app.TruckListItemView()

    it "uses an a element for its tag", ->
      expect(@view.tagName).toEqual("a")
      expect(@view.className).toEqual("list-group-item")

  describe "render", ->
    beforeEach ->
      fixture.set "<div id='list'></div>"
      @truck = new app.Truck({ name: "Truckee", geocoded_address: "1 Laurel Street", hours: "9am-5pm" })
      @view = new app.TruckListItemView(model: @truck)
      $('#list').append(@view.render().el)

    it "renders its name, geocoded_address and hours", ->
      expect($('#list').text()).toContain("Truckee")
      expect($('#list').text()).toContain("1 Laurel Street")
      expect($('#list').text()).toContain("9am-5pm")
