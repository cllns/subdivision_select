require "rails_helper"
feature "select boxes via FormBuilder and FormTagHelper" do
  before(:each) do
    @address = create(:mass_address)
  end

  # The root URL is FormBuilder, and /tags is the FormTagHelper
  URLS = "/", "/tags"

  URLS.each do |url|
    scenario "load page", js: true do
      visit url
      expect(page).to have_content "Demo"

      expect(page).to have_select(
        "address_country",
        with_options: ["United States", "India"]
      )

      expect(find('select#address_subdivision').value).to eq("MA")

      expect(page).to have_select(
        "address_subdivision",
        with_options: ["Alaska", "Wyoming", "Massachusetts"]
      )
    end

    scenario "click Guam", js: true do
      visit url

      select "Guam", from: "Country"
      expect(page).to have_select(
        "address_subdivision",
        disabled: true
      )
    end

    scenario "click Germany", js: true do
      visit url

      select "Germany", from: "Country"
      expect(page).to have_select(
        "address_subdivision",
        with_options: ["", "Berlin", "Hamburg", "Bayern"]
      )
    end

    scenario "click and save Ireland/Dublin", js: true do
      visit url

      select "Ireland", from: "Country"
      select "Dublin", from: "State / Province"
      click_button "Update Address"
      expect(@address.reload.country).to eq("IE")
      expect(@address.reload.subdivision).to eq("D")
    end
  end
end
