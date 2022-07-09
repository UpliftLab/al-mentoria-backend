require 'rails_helper'

RSpec.describe '/reservations', type: :request do
  before do
    @user = User.second
    @mentor_topic = MentorTopic.first
  end

  let(:valid_attributes) do
    {
      user_id: @user.id,
      mentor_topic_id: @mentor_topic.id,
      date: Time.now.utc.to_date + 1.day
    }
  end

  let(:invalid_attributes) do
    {
      user_id: @user.id,
      mentor_topic_id: @mentor_topic.id,
      date: Time.now.utc.to_date - 1.day
    }
  end

  let(:valid_headers) do
    {
      Authorization: "Bearer #{@user.generate_jwt}"
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Reservation.create! valid_attributes
      get reservations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Reservation' do
        expect do
          post reservations_url,
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(Reservation, :count).by(1)
      end

      it 'renders a JSON response with the new reservation' do
        post reservations_url,
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Reservation' do
        expect do
          post reservations_url,
               params: invalid_attributes, as: :json
        end.to change(Reservation, :count).by(0)
      end

      it 'renders a JSON response with errors for the new reservation' do
        post reservations_url,
             params: { reservation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested reservation' do
      reservation = Reservation.create! valid_attributes
      expect do
        delete reservation_url(reservation), headers: valid_headers, as: :json
      end.to change(Reservation, :count).by(-1)
    end
  end
end
