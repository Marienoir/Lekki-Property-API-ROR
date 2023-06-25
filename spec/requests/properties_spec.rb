require "swagger_helper"

RSpec.describe "properties", type: :request do
  path "/properties" do
    post("createProperty property") do
      response(200, "successful") do
        consumes "application/json"
        parameter name: :propertyAddress, in: :body, schema: {
          type: :object,
          properties: {
            propertyOwner: { type: :string },
            propertyAddress: { type: :string },
            numberOfBathrooms: { type: :integer },
            numberOfBedrooms: { type: :integer },
            numberOfKitchens: { type: :integer },
            numberOfSittingRooms: { type: :integer },
            numberOfToilets: { type: :integer },
            description: { type: :string },
          },
          required: %w[propertyOwner propertyAddress],
        }

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

    get("findAllProperties property") do
      response(200, "successful") do
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

  path "/properties/search" do
    get("search property") do
      response(200, "successful") do
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

  path "/properties/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id", in: :path, type: :string, description: "id"

    get("findPropertiesById property") do
      response(200, "successful") do
        let(:id) { "123" }

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

    put("updatePropertyById property") do
      response(200, "successful") do
        let(:id) { "123" }

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
