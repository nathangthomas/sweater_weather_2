class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :currently, :today, :hourly, :daily, :current_time, :current_date, :timezone, :coordinates
end
