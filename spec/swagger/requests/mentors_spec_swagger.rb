require 'swagger_helper'

RSpec.describe '/mentors', type: :request do
  path '/mentors' do
    get('list mentors') do
      tags 'Mentors'
      response(200, 'Successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('add a mentor') do
      tags 'Mentors'
      security [bearerAuth: {}]
      consumes 'application/json'
      parameter name: :mentor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          bio: { type: :string },
          photo: { type: :string }
        },
        required: %w[name bio photo]
      }
      response(201, 'Mentor got saved successfully') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor) { { name: 'John', bio: 'Some bio', photo: 'https://www.something.com/photo.png' } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, "Mentor couldn't be saved") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor) { { name: 'John', bio: 'Some bio', photo: 'photo' } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/mentors/{mentor_id}' do
    parameter name: 'mentor_id', in: :path, type: :integer, description: 'Mentor id'
    delete('delete a topic for a mentor') do
      tags 'Mentors'
      security [bearerAuth: {}]
      response(204, 'Mentor got removed successfully') do
        let(:mentor_id) { '2' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(409, 'There are reservations for this mentor') do
        let(:mentor_id) { '2' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Mentor not found') do
        let(:mentor_id) { '10' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/mentors/{mentor_id}' do
    parameter name: 'mentor_id', in: :path, type: :integer, description: 'Mentor id'

    get('get a mentor') do
      tags 'Mentors'
      response(200, 'Successful') do
        let(:mentor_id) { '2' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Mentor not found') do
        let(:mentor_id) { '10' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete a topic for a mentor') do
      tags 'Mentors'
      security [bearerAuth: {}]
      response(204, 'Mentor got removed successfully') do
        let(:mentor_id) { '2' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(409, 'There are reservations for this mentor') do
        let(:mentor_id) { '2' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Mentor not found') do
        let(:mentor_id) { '10' }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
