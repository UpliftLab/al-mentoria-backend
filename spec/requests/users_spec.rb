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
    parameter name: "name", in: :path, type: :string, description: "name"
    parameter name: "email", in: :path, type: :string, description: "email"
    parameter name: "password", in: :path, type: :string, description: "password"
    post("sign-up") do
      response(200, "successful") do
        let(:name) { "donald" }
        let(:email) { "donald@nomail.com" }
        let(:password) { "123123" }
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
