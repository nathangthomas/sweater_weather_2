class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(params[:id])
    if user.
      render json: UserSerializer.new(user)
    else
      #sad path here
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
