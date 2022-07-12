class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      render json: { data: { token:, name: user.name, role: user.role } }
    else
      render json: { error: create_error('Login failed!', details: { 'email or password' => ['is invalid'] }) }, status: :unprocessable_entity
    end
  end

  def sign_in_params
    params.require(:session).permit(:email, :password)
  end
end
