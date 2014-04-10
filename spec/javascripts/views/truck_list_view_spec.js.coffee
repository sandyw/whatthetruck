describe "TruckListView", ->
  beforeEach ->
    fixture.set "<div id='list'></div>"
    @trucks = new app.TruckList()
    @trucks.push { name: "Super Food Truck", geocoded_address: '123' }
    @trucks.push { name: "Chomp Chomp", geocoded_address: '123' }
    @view = new app.TruckListView(model: @trucks, el: '#list')

  it "renders the individual trucks", ->
    expect($('#list').text()).toContain("Super Food Truck")
    expect($('#list').text()).toContain("Chomp Chomp")
