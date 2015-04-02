Rails.application.routes.draw do
  get "addresses_demo/index"

  root "addresses_demo#index"

  mount SubdivisionSelect::Engine => "/subdivisions"
end
