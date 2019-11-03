class Api::V1::LocationController < ApplicationController

  def index
    render json: LocationSerializer.new(location_facade.location)
  end

private

  def location_facade
    LocationsFacade.new(params[:location])
  end
end
