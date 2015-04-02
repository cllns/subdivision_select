require "countries"

module SubdivisionSelect
  module SubdivisionsHelper
    def self.get_subdivisions(alpha2)
      # The countries gem returns a hash, where:
      # the keys are the ISO 3166-2 subdivision two letter codes
      # and the value is a hash with two key/values:
      # - "name" is the most popular/most correct name
      # - "names" is an array of all the names
      if Country[alpha2].nil?
        {}
      else
        Country[alpha2].subdivisions.map { |k, v| [k, v["name"]] }.to_h
      end
    end

    def self.get_subdivisions_for_select(alpha2)
      get_subdivisions(alpha2).invert.to_a
    end
  end
end
