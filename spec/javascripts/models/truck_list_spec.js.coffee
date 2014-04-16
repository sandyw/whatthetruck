define ['collections/truck_list', 'models/truck'], (TruckList, Truck) ->
  describe "TruckList", ->
    it "defines its model as app.Truck", ->
      @list = new TruckList()
      expect(@list.model).toEqual(Truck)
