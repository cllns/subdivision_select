module SubdivisionSelect
  #class CountryNotFoundError < StandardError;end
  module TagHelper
    def subdivision_option_tags
      option_tags_options = {
        selected: @options.fetch(:selected) { value(@object) },
        disabled: @options[:disabled]
      }

      # Actual loading of subdivisions is in a View helper, since the controller
      # needs to use it, to render the subdivisions of a country in JSON
      subdivisions = SubdivisionsHelper::get_subdivisions_for_select(country)
      options_for_select(subdivisions, option_tags_options)
    end

    private

    def country
      @options[:country]
    end
  end
end

