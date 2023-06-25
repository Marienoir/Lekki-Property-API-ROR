Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  post "/properties", to: "properties#create"
  get "/properties", to: "properties#find_all"
  get "/properties/:id", to: "properties#find_by_id"
  put "/properties/:id", to: "properties#update"
end
