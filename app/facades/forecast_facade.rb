class ForecastFacade
  attr_reader :id

  def initialize(city_state)
    @city_state = city_state
  end

  def forecast
    location = location(@city_state)
    Forecast.new(data_for(location))
  end

  def city_image
    Image.new(image_for(@city_state))
  end
  private

  def data_for(location)
    @_data_for ||= DarkSkyService.new.forecast_by(location)
  end

  def location(city_state)
    LocationsFacade.new(city_state).location
  end

  def image_for(city_state)
    @_image_for ||= flickr_service
  end

  def flickr_service
    FlickrService.new.image_of(city_state)
  end

end
