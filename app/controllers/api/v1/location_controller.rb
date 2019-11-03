class Api::V1::LocationController < ApplicationController

  def index
    render json: LocationSerializer.new(location_facade)
  end

private

  def location_facade
    facade = LocationsFacade.new(params[:location])
    facade.location
  end
end
