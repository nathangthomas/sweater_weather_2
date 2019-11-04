class Api::V1::AntipodeController < ApplicationController
  def index
    render json: AntipodeSerializer.new(antipode_facade)
  end

private

  def antipode_facade
    facade = AntipodeFacade.new(params[:location])
  end
end
