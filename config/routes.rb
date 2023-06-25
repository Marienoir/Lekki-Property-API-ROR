Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post "/properties", to: "properties#createProperty"
  get "/properties", to: "properties#findAllProperties"
  get "/properties/search", to: "properties#search"
  get "/properties/:id", to: "properties#findPropertiesById"
  put "/properties/:id", to: "properties#updatePropertyById"
end
