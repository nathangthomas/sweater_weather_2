class Api::V1::Places::LocationsController < ApplicationController

  def index
    render json: LocationSerializer.new(location_facade.location)
  end
private

  def location_facade
    LocationsFacade.new(params[:city])
  end
end
