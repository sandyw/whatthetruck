describe "TruckList", ->
  it "defines its model as app.Truck", ->
    @list = new app.TruckList()
    expect(@list.model).toEqual(app.Truck)
