require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    # load 'db/seeds.rb'
    @admin_user = User.first
    @basic_user = User.last
  end
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_registration_attributes) do
    {
      name: 'Kaladin',
      email: 'kaladin@rochar.cos',
      password: '123123'
    }
  end

  let(:invalid_registration_attributes) do
    {
      name: 'Hoid',
      email: '',
      password: '123123'
    }
  end

  let(:valid_session_attributes) do
    {
      email: 'soufiane@nomail.com',
      password: '123123'
    }
  end

  let(:invalid_session_attributes) do
    {
      email: '',
      password: '123123'
    }
  end

  let(:a_jwt_token) { a_string_matching(/.+\..+\..+/) }

  describe 'POST /users' do
    context 'with valid parameters' do
      it 'Signs up and renders a successful response' do
        post user_registration_url, params: { registration: valid_registration_attributes }
        json_body = JSON.parse(response.body)
        expect(response).to be_successful
        expect(json_body).to match(
          'data' => {
            'token' => a_jwt_token
          }
        )
      end
    end

    context 'with non-valid parameters' do
      it 'renders an error response' do
        post user_registration_url, params: { registration: invalid_registration_attributes }
        json_body = JSON.parse(response.body)

        expect(response).to have_http_status :unprocessable_entity
        expect(json_body).to match(
          'error' => {
            'message' => 'Registration failed!',
            'details' => {
              'email or password' => [
                'is invalid'
              ]
            }
          }
        )
      end
    end
  end

  describe 'POST /users/sign_in' do
    context 'with valid parameters' do
      it 'Logins and renders a successful response' do
        post user_session_url, params: { session: valid_session_attributes }
        json_body = JSON.parse(response.body)

        expect(response).to be_successful
        expect(json_body).to match(
          'data' => {
            'token' => a_jwt_token,
            'name' => be_an_instance_of(String),
            'role' => be_an_instance_of(String)
          }
        )
      end
    end

    context 'with non-valid parameters' do
      it 'renders an error response' do
        post user_session_url, params: { session: invalid_session_attributes }
        json_body = JSON.parse(response.body)

        expect(response).to have_http_status :unprocessable_entity
        expect(json_body).to match(
          'error' => {
            'message' => 'Login failed!',
            'details' => {
              'email or password' => [
                'is invalid'
              ]
            }
          }
        )
      end
    end
  end

  before do
    @token = @basic_user.generate_jwt
  end

  let(:valid_headers) do
    {
      Authorization: "Bearer #{@token}"
    }
  end

  let(:invalid_headers) do
    {
      Authorization: 'Bearer any_invalid_token'
    }
  end

  describe 'GET /users/me' do
    context 'with valid headers' do
      it 'Renders a json response with token and user data' do
        get users_me_url, headers: valid_headers
        expect(response).to have_http_status(:ok)
        json_body = JSON.parse(response.body)
        expect(json_body).to match(
          'data' => {
            'token' => @token,
            'name' => @basic_user.name,
            'role' => @basic_user.role
          }
        )
      end
    end

    context 'with no headers' do
      it 'Responds user unauthorized' do
        get users_me_url
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid authorization token' do
      it 'Responds user unauthorized' do
        get users_me_url, headers: invalid_headers
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
