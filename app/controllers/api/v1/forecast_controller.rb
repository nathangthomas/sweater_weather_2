class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(forecast_facade.forecast)
  end

private

  def forecast_facade
    ForecastFacade.new(params[:location])
  end
end
