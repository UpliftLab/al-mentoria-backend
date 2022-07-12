class ApplicationController < ActionController::API
  respond_to :json
  before_action :process_token
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  private

  def process_token
    return unless request.headers['Authorization'].present?

    begin
      jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                               Rails.application.secrets.secret_key_base).first
      @current_user_id = jwt_payload['id']
    rescue JWT::ExpiredSignature
      render json: { error: create_error('Token expired!') }, status: :unauthorized
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { error: create_error('Verification of token failed!') }, status: :unauthorized
    end
  end

  def authenticate_user!(_ = {})
    render json: { error: create_error('Must be logged in') }, status: :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

  def create_error(message, details: {})
    {
      message:,
      details:
    }
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: create_error(exception) }, status: :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: create_error('Resource not found!') }, status: :not_found
  end

  rescue_from ActionController::RoutingError do
    render json: { error: 'bad route' }, status: :not_found
  end
end
