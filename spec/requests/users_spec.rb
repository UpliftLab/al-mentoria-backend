require "swagger_helper"

RSpec.describe "users", type: :request do
  path "/users/sign_in" do
    post("sign-in") do
      consumes "application/json"
      parameter name: :users, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: ["email", "password"],
      }
      response(200, "successful") do
        let(:users) { { email: "donald@nomail.com", password: "123123" } }
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

  path "/users" do
    post("sign-up") do
      consumes "application/json"
      parameter name: :users, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
        },
        required: ["email", "password"],
      }
      response(200, "successful") do
        let(:users) { { name: "John", email: "john@nomail.com", password: "123123" } }
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
