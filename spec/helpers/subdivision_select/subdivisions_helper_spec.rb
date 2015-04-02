require "rails_helper"

# Specs in this file have access to a helper object that includes
# the SubdivisionsHelper. For example:
#
# describe SubdivisionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
module SubdivisionSelect
  RSpec.describe SubdivisionsHelper, type: :helper do
    it "gets subdivisions for Germany" do
      expect(SubdivisionsHelper::get_subdivisions("DE")["BE"]).to eq("Berlin")
      expect(SubdivisionsHelper::get_subdivisions("DE").count).to eq(16)
    end

    # TODO: actually check if a select would be correct
    it "gets subdivisions_for_select for Germany" do
      german_states = SubdivisionsHelper::get_subdivisions("DE")
      for_select = SubdivisionsHelper::get_subdivisions_for_select("DE")
      expect(for_select).to eq(german_states.invert.to_a)
    end
  end
end
