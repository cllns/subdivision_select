Address.destroy_all

Address.create!(
  title: "Empty"
)

Address.create!(
  title: "Massachusetts, USA",
  country: "US",
  subdivision: "MA"
)

Address.create!(
  title: "Ireland, without subdivision",
  country: "IE"
)
