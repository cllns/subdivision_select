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

        options.merge!({ object: @object })

        # Add class (that JS uses)
        if html_options["class"].present?
          html_options["class"] += " subdivision-selector"
        else
          html_options["class"] = "subdivision-selector"
        end

        subdivision_select_hidden_field(method).render + Tags::Select.new(
          @object_name,
          method,
          @template,
          SubdivisionSelect::SubdivisionsHelper::get_subdivisions_for_select(country),
          options,
          html_options
        ).render
      end

      private

      # We want to add a hidden field, so that when this select is disabled
      # (which happens when a country have no subdivisions), we still POST this
      # value, as blank. Otherwise we'd keep the old value.
      # NOTE: it has to come *before* the actual select, so that its value
      # can be overridden by the select
      def subdivision_select_hidden_field(method)
        Tags::HiddenField.new(
          @object_name,
          method,
          @template,
          value: ""
        )
      end
    end
  end
end
