require "swagger_helper"

RSpec.describe "/topics", type: :request do
  path "/topics" do
    get("list topics") do
      tags "Topics"
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

    post("add a topic") do
      tags "Topics"
      security [bearerAuth: {}]
      consumes "application/json"
      parameter name: :topic, in: :body, schema: {
        type: :object,
        properties: {
          label: { type: :string },
          icon: { type: :string },
        },
        required: ["label", "icon"],
      }
      response(201, "Topic saved successfully") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:topic) { { label: "Ruby", icon: "https://www.something.com/icon.png" } }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end

      response(422, "Topic couldn't be saved") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:topic) { { label: "Ruby", icon: "1" } }
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

  path "/topics/{topic_id}" do
    parameter name: "topic_id", in: :path, type: :integer, description: "Topic id"
    delete("delete a topic for a mentor") do
      tags "Topics"
      security [bearerAuth: {}]
      response(204, "Mentor topic got removed successfully") do
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

      response(409, "There are reservations for this topic") do
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

      response(404, "Topic was not found") do
        let(:topic_id) { "7" }
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

      response(422, "Topic was not deleted") do
        let(:topic_id) { "7" }
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
