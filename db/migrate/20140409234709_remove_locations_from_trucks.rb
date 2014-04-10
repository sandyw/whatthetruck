class RemoveLocationsFromTrucks < ActiveRecord::Migration
  def change
    remove_column :trucks, :user_address, :string
    remove_column :trucks, :geocoded_address, :string
    remove_column :trucks, :latitude, :float
    remove_column :trucks, :longitude, :float
  end
end
