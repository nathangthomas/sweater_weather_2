class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: ImageSerializer.new(forecast_facade)
  end

private

  def forecast_facade
    facade = ForecastFacade.new(params[:location])
    facade.city_image
  end
end
