require "swagger_helper"

RSpec.describe "properties", type: :request do
  path "/properties" do
    post("create property") do
      response(200, "successful") do
        consumes "application/json"
        parameter in: :body, schema: {
                    type: :object,
                    properties: {
                      property_address: { type: :string },
                      property_type: { type: :string },
                      number_of_bathrooms: { type: :integer },
                      number_of_bedrooms: { type: :integer },
                      number_of_sitting_rooms: { type: :integer },
                      number_of_toilets: { type: :integer },
                      number_of_kitchens: { type: :integer },
                      property_owner: { type: :string },
                      description: { type: :string },
                      valid_from: { type: :string, format: :date },
                      valid_to: { type: :string, format: :date },
                    },
                    required: %w[property_address property_type valid_from valid_to description property_owner number_of_kitchens number_of_toilets number_of_bathrooms number_of_bedrooms number_of_sitting_rooms],
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

    get("find_all property") do
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

    get("find_by_id property") do
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

    put("update property") do
      response(200, "successful") do
        let(:id) { "123" }
        consumes "application/json"
        parameter in: :body, schema: {
                    type: :object,
                    properties: {
                      number_of_bathrooms: { type: :integer },
                      number_of_bedrooms: { type: :integer },
                      number_of_sitting_rooms: { type: :integer },
                      number_of_toilets: { type: :integer },
                      number_of_kitchens: { type: :integer },
                      description: { type: :string },
                      valid_from: { type: :string, format: :date },
                    },
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
  end
end
