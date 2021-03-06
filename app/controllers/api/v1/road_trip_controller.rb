class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: RoadTripSerializer.new(road_trip_facade)
    else
      render json: { error: "Your API key is invalid." }, status: :unauthorized
    end
  end

private

  def road_trip_facade
    RoadTripFacade.new(params)
  end

end
