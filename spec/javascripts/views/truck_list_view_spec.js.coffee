define ['collections/truck_list', 'views/truck_list_view'], (TruckList, TruckListView) ->
  describe "TruckListView", ->
    beforeEach ->
      fixture.set "<div id='list'></div>"
      @trucks = new TruckList()
      @trucks.push { name: "Super Food Truck", geocoded_address: '123' }
      @trucks.push { name: "Chomp Chomp", geocoded_address: '123' }
      @view = new TruckListView(model: @trucks, el: '#list')

    it "renders the individual trucks", ->
      expect($('#list').text()).toContain("Super Food Truck")
      expect($('#list').text()).toContain("Chomp Chomp")
