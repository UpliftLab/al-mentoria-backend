require "swagger_helper"

RSpec.describe "/mentors/{id}/topics", type: :request do
  path "/mentors/{mentor_id}/topics" do
    parameter name: "mentor_id", in: :path, type: :integer, description: "Mentor id"
    get("list topics of a specific mentor") do
      tags "Mentor topics"
      security [bearerAuth: {}]
      response(200, "Successful") do
        let(:id) { "1" }
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

    post("add a topic for a mentor") do
      tags "Mentor topics"
      security [bearerAuth: {}]
      consumes "application/json"
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          mentor_id: { type: :integer },
          topic_id: { type: :integer },
          rating: { type: :integer },
        },
        required: ["mentor_id", "topic_id", "rating"],
      }
      response(201, "Mentor topic saved successfully") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor_topic) { { mentor_id: 1, topic_id: 1, rating: 2 } }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end

      response(422, "Mentor topic couldn't be saved") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor_topic) { { mentor_id: 1, topic_id: 1, rating: 2 } }
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

  path "/mentors/{mentor_id}/topics/{topic_id}" do
    parameter name: "mentor_id", in: :path, type: :integer, description: "Mentor id"
    parameter name: "topic_id", in: :path, type: :integer, description: "Topic id"
    delete("delete a topic for a mentor") do
      tags "Mentor topics"
      security [bearerAuth: {}]
      response(204, "Mentor topic got removed successfully") do
        let(:mentor_id) { "2" }
        let(:topic_id) { "1" }
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

      response(409, "Mentor has a reservation with this topic") do
        let(:mentor_id) { "2" }
        let(:topic_id) { "1" }
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

      response(404, "Mentor topic not found") do
        let(:mentor_id) { "2" }
        let(:topic_id) { "1" }
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
    end
  end
end
