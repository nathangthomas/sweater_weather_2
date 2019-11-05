class GifsFacade
  attr_reader :id

  def initialize(location)
    @id = rand(0..99)
    @location = location
  end

  def get_gifs
    hourly_forecast.map do |forecast|
    gif_for(forecast[:summary],forecast[:time])
    end
  end

private

  def gif_for(summary, time)
    gif_data = GiphyService.new.gif_by(summary)
    parsed_data = JSON.parse(gif_data.body, symbolize_names: true)
    Gif.new(parsed_data, summary, time)
  end

  def hourly_forecast
    forecast_object = ForecastFacade.new(@location).forecast
    forecast_object.hourly
  end

end
