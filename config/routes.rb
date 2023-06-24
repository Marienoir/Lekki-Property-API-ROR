Rails.application.routes.draw do
  post "/properties", to: "properties#createProperty"
  get "/properties", to: "properties#findAllProperties"
  get "/properties/search", to: "properties#search"
  get "/properties/:id", to: "properties#findPropertiesById"
  put "/properties/:id", to: "properties#updatePropertyById"
end
