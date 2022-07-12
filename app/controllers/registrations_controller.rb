class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)

    if user.save
      token = user.generate_jwt
      render json: { data: {token: token.to_json} }
    else
      render(
        json: {
          error: create_error(
            'Registration failed!',
            details: { 'email or password' => ['is invalid'] }
          )
        },
        status: :unprocessable_entity
      )
    end
  end

  def sign_up_params
    params.require(:registration).permit(:name, :email, :password)
  end
end
