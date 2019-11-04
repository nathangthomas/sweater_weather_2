class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserFacade.new(user), status: :created
    else
      UserFacade.new(user).error_message
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
