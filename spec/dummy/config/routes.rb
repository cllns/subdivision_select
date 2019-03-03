Rails.application.routes.draw do
  patch ":id", to: "addresses_demo#update", as: "update_address"

  root "addresses_demo#index"
  get "tags" => "addresses_demo#tags"
  get "custom_field" => "addresses_demo#custom_field"

  mount SubdivisionSelect::Engine => "/subdivisions"
end
