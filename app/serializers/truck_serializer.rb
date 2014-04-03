class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude
end
