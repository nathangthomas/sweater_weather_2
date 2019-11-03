class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :currently, :today, :tonight, :hourly, :daily, :timezone, :coordinates
end
