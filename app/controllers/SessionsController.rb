class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_in_params
    params.permit(:email, :password)
  end
end
