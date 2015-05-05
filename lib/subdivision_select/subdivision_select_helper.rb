module ActionView
  module Helpers
    class FormBuilder
      def subdivision_select(method, country_or_options = {}, options = {}, html_options = {})
        # Shift args, if necessary
        if Hash === country_or_options
          html_options = options
          options = country_or_options
        else
          country = country_or_options
        end

        # Add class (that JS uses)
        if html_options["class"].present?
          html_options["class"] += " subdivision-selector"
        else
          html_options["class"] = "subdivision-selector"
        end

        Tags::Select.new(
          @object_name,
          method,
          @template,
          SubdivisionSelect::SubdivisionsHelper::get_subdivisions_for_select(country),
          options,
          html_options
        ).render
      end
    end
  end
end
