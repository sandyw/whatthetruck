class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :geocoded_address
end
