class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :travel_time, :forecast_upon_arrival
end
