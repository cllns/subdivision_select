require "rails_helper"

RSpec.describe AddressesDemoController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      @address = create(:address)
      post :patch, subdivision: "AB", country: "CD"
      expect(response).to have_http_status(:success)
    end
  end
end
