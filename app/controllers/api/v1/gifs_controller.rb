class Api::V1::GifsController < ApplicationController

  def index
    render json: GifsSerializer.new(gifs_facade)
  end

private

  def gifs_facade
    facade = GifsFacade.new(params[:location])
    facade.get_gifs
  end
end
