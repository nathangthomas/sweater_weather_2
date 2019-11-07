class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)

    else
      render json: {
        error: "Something went wrong please try again"
        }, status: :bad_request
    end
  end

end
