class Api::V1::GifsController < ApplicationController

  def index

    get_gifs
    # render json: GifsSerializer.new(gif)
  end
# maybe pass data to gif class with method below
  # def gif_for(summary)
  #   gif_data = GiphyService.new.gif_by(summary)
  #   parsed_data = JSON.parse(gif_data.body, symbolize_names: true)
  #   Gif.new(parsed_data)
  # end

  def gif_for(summary, time)
    gif_data = GiphyService.new.gif_by(summary)
    parsed_data = JSON.parse(gif_data.body, symbolize_names: true)
    Gif.new(parsed_data, summary, time)
  end

  def hourly_forecast
    forecast_object = ForecastFacade.new(params[:location]).forecast
    forecast_object.hourly
  end

  def get_gifs
    hourly_forecast.map do |forecast|
      gif_data = gif_for(forecast[:summary],forecast[:time])
    end
  end

end
