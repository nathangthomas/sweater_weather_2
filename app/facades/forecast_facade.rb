class ForecastFacade
  attr_reader :id

  def initialize(city_state)
    @city_state = city_state
  end

  def forecast
    location = location(@city_state)
    Forecast.new(data_for(location))
  end

  private

  def data_for(location)
    @_data_for ||= DarkSkyService.new.forecast_by(location)
  end

  def location(city_state)
    LocationsFacade.new(city_state).location
  end

end
