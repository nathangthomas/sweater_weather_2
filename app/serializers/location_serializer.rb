class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :lat, :lng, :coordinates, :city, :state, :country
end
