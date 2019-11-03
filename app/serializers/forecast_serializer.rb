class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_time, :current_date, :currently, :today, :hourly, :daily, :timezone, :coordinates
end
