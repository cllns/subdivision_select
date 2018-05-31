module SubdivisionSelect
  #class CountryNotFoundError < StandardError;end
  module TagHelper
    def subdivision_option_tags
      # In Rails 5.2+, `value` accepts no arguments and must also be called
      # called with parens to avoid the local variable of the same name
      # https://github.com/rails/rails/pull/29791
      selected_option = @options.fetch(:selected) do
        if self.method(:value).arity == 0
          value
        else
          value(@object)
        end
      end

      option_tags_options = {
        selected: selected_option,
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

