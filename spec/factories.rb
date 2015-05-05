FactoryGirl.define do
  factory :address do
    title "Blank Address"

    factory :mass_address do
      title "Massachusetts Address"
      country "US"
      subdivision "MA"
    end
  end
end
