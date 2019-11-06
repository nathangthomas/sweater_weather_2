class RoadTripFacade
  attr_reader :id, :travel_time, :forecast_upon_arrival

  def initialize(params)
    @id = rand(0..99)
    @origin = params[:origin]
    @destination = params[:destination]
    @travel_time = travel_time_text
    @forecast_upon_arrival = forecast_upon_arrival
  end

  def forecast_upon_arrival
    hourly_forecast = destination_current_forecast.hourly
    hourly_forecast.find do |hour|
      hour[:time] >= arrival_time
    end
  end
  
private


  def destination_current_forecast
    forecast_data = DarkSkyService.new.forecast_by(location)
    Forecast.new(forecast_data)
  end

  def location
    location_data = GoogleService.new.location_by_city(@destination)
    Location.new(location_data)
  end

  def arrival_time
    date_object = Time.now.utc + travel_time_value
    date_object.to_i
  end

  def travel_time_text
    road_trip_data[:routes][0][:legs][0][:duration][:text]
  end

  def travel_time_value
    road_trip_data[:routes][0][:legs][0][:duration][:value]
  end

  def road_trip_data
    service = GoogleService.new
    service.time_to_travel_between(@origin, @destination)
  end

end
