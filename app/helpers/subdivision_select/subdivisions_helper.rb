module SubdivisionSelect
  module SubdivisionsHelper

    DEFAULT_OPTION = {
      translation: 'zh'
    }.with_indifferent_access.freeze

    def self.get_subdivisions(alpha2, option = {})
      # The countries gem returns a hash, where:
      # the keys are the ISO 3166-2 subdivision two letter codes
      # and the value is a hash with two key/values:
      # - "name" is the most popular/most correct name
      # - "names" is an array of all the names

      option = DEFAULT_OPTION.merge(option)

      if ISO3166::Country[alpha2].nil?
        {}
      else
        subdivisions = ISO3166::Country[alpha2].subdivisions.map do |k, v|
          [
            k,
            v['translations'][option[:translation]] || v['name']
          ]
        end

        alpha2 == 'TW' ? order_subdivisions(subdivisions) : subdivisions.to_h
      end
    end

    def self.order_subdivisions(subdivisions)
      return subdivisions.to_h unless File.exist?(reference_source_path)

      reference_order = YAML.load_file(reference_source_path)

      subdivisions.sort_by { |e| [reference_order.index(e[0]), e] }.to_h
    end

    def self.reference_source_path
      Rails.root.join('config', 'subdivisions_order.yml')
    end

    def self.get_subdivisions_for_select(alpha2, option = {})
      get_subdivisions(alpha2, option).invert.to_a
    end
  end
end
