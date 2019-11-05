class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
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
