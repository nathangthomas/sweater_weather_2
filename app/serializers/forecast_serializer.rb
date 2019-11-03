class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_time_and_date, :currently, :today, :hourly, :daily, :timezone, :coordinates
end
