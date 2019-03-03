require "rails_helper"

module SubdivisionSelect
  RSpec.describe SubdivisionsController, type: :controller do
    routes { SubdivisionSelect::Engine.routes }

    describe "GET #get" do
      it "returns http success in JSON, when correct param supplied" do
        get :get, params: {country_code: "IE"}
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json")
      end

      it "returns http success in JSON, w/o correct param supplied" do
        get :get
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json")
      end

    end
  end
end
