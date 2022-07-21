class UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    render json: {
      data: {
        token: request.headers['Authorization'].split[1],
        name: current_user.name,
        role: current_user.role
      }
    }
  end
end
