Rails.application.routes.draw do
  patch ":id", to: "addresses_demo#update", as: "update_address"

  root "addresses_demo#index"
  get "tags" => "addresses_demo#tags"

  mount SubdivisionSelect::Engine => "/subdivisions"
end
