module SubdivisionSelect
  module SubdivisionsHelper
    def self.get_subdivisions(alpha2)
      # The countries gem returns a hash, where:
      # the keys are the ISO 3166-2 subdivision two letter codes
      # and the value is a hash with two key/values:
      # - "name" is the most popular/most correct name
      # - "names" is an array of all the names
      if ISO3166::Country[alpha2].nil?
        {}
      else
        subdivisions = ISO3166::Country[alpha2].subdivisions.map do |k, v|
          value = alpha2 == 'TW' ? v["translations"]["zh"] : v["name"]

          [
            k,
            value
          ]
        end

        alpha2 == 'TW' ? order_subdivisions(subdivisions) : subdivisions.to_h
      end
    end

    def self.order_subdivisions(subdivisions)
      return subdivisions.to_h unless File.exists?(reference_source_path)

      reference_order = YAML.load_file(reference_source_path)

      subdivisions.sort_by { |e| [reference_order.index(e[0]), e] }.to_h
    end

    def self.reference_source_path
      Rails.root.join('config', 'subdivisions_order.yml')
    end

    def self.get_subdivisions_for_select(alpha2)
      get_subdivisions(alpha2).invert.to_a
    end
  end
end
