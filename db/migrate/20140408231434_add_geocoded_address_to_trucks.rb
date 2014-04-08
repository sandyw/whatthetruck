class AddGeocodedAddressToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :geocoded_address, :string
  end
end
