class Api::V1::ForecastController < ApplicationController

  def index
    render json: ForecastSerializer.new(forecast_facade)
  end

private

  def forecast_facade
    facade = ForecastFacade.new(params[:location])
    facade.forecast
  end
end
