require "swagger_helper"

RSpec.describe "/reservations", type: :request do
  path "/reservations" do
    get("list reservations") do
      tags "Reservations"
      security [bearerAuth: {}]
      response(200, "Successful") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end

      response(401, "Not authorized") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    post("create reservation") do
      tags "Reservations"
      security [bearerAuth: {}]
      consumes "application/json"
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          mentor_topic_id: { type: :integer },
          date: { type: :string },
        },
        required: ["user_id", "mentor_topic_id", "date"],
      }
      response(201, "Reservation got created successfully") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:reservation) { { user_id: 1, mentor_topic_id: 1, date: "2022-07-08" } }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end

      response(401, "Not authorized") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  path "/reservations/{id}" do
    parameter name: "id", in: :path, type: :integer, description: "id"
    delete("delete reservation") do
      tags "Reservations"
      security [bearerAuth: {}]
      response(204, "Reservation got deleted successfully") do
        let(:id) { "123" }
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end

      response(401, "Not authorized") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
