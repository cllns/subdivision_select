require "rails_helper"
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe AddressesDemoController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tags" do
    it "returns http success" do
      get :tags
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      @address = create(:address)
      patch :update, params: {id: @address.id, address: { subdivision: "D", country: "IE" }}
      expect(assigns(:address).country).to eq("IE")
      expect(assigns(:address).subdivision).to eq("D")
    end
  end
end
