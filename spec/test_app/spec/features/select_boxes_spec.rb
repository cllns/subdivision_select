require "rails_helper"

feature "select boxes" do
  scenario "load page", js: true do
    visit "/"
    expect(page).to have_content "Addresses Demo"

    within "form.prepopulated-for-ireland" do
      expect(page).to have_select(
        "prepopulated-for-ireland_address_subdivision",
        with_options: ["Dublin", "Cork", "Sligo"]
      )
    end
  end

  scenario "click Guam", js: true do
    visit "/"

    within "form.basic" do
      select "Guam", from: "Country"
      expect(page).to have_select(
        "basic_address_subdivision",
        disabled: true
      )
    end
  end

  scenario "click Germany", js: true do
    visit "/"

    within "form.basic" do
      select "Germany", from: "Country"
      expect(page).to have_select(
        "basic_address_subdivision",
        with_options: ["Berlin", "Hamburg", "Bayern"]
      )
    end
  end

  scenario "prepopulate with include_blank", js: true do
    visit "/"


    within "form.prepopulated-for-ireland-include-blank" do
      expect(page).to have_select(
        "prepopulated-for-ireland-include-blank_address_subdivision",
        with_options: ["", "Dublin"]
      )

      # Make sure the blank stays there even after changing countries
      select "Germany", from: "Country"

      expect(page).to have_select(
        "prepopulated-for-ireland-include-blank_address_subdivision",
        with_options: ["", "Berlin"]
      )
    end
  end
end
