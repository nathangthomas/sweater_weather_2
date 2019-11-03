class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :lat, :lng, :coordinates, :city, :state, :country
end
