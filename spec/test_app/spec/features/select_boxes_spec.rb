require "rails_helper"

feature "select boxes" do
  scenario "load page", js: true do
    visit "/"
    expect(page).to have_content "Addresses Demo"
    expect(page).to have_select(
      "address_subdivision",
      with_options: ["Dublin", "Cork", "Sligo"]
    )
  end

  scenario "click Guam", js: true do
    visit "/"
    select "Guam", from: "Country"
    expect(page).to have_select("address_subdivision", disabled: true)
  end

  scenario "click Germany", js: true do
    visit "/"
    select "Germany", from: "Country"
    expect(page).to have_select(
      "address_subdivision",
      with_options: ["Berlin", "Hamburg", "Bayern"]
    )
  end
end
