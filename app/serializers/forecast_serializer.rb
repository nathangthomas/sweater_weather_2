class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :currently, :today, :tonight, :hourly, :daily, :timezone, :coordinates
  
end
