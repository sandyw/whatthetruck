ActiveAdmin.register Location do
  permit_params :truck_id, :latitude, :longitude, :user_address, :geocoded_address, :from, :to
end
