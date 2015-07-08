module ActionView
  module Helpers
    class FormBuilder
      def subdivision_select(method, country_or_options = {}, options = {}, html_options = {})
        # Shift args, if necessary
        if Hash === country_or_options
          html_options = options
          options = country_or_options
        else
          options[:country] = country_or_options
        end

        # I think this is taken care of in the merge below?
        #options.merge!({ object: @object })

        @template.subdivision_select_tag(
          @object_name,
          method,
          objectify_options(options),
          @default_options.merge(html_options)
        )
      end
    end

    module FormOptionsHelper
      def subdivision_select_tag(object, method, options = {}, html_options = {})
        Tags::SubdivisionSelect.new(
          object,
          method,
          self,
          options,
          html_options
        ).render
      end
    end

    module Tags
      # TODO: can we inherit from Select?
      class SubdivisionSelect < Base
        include ::SubdivisionSelect::TagHelper

        def initialize(object_name, method_name, template_object, options, html_options)
          @html_options = html_options
          # Add data attribue, for selecting via JS
          @html_options["data-subdivision-selector"] = "1"

          super(object_name, method_name, template_object, options)
        end

        def render
          select_content_tag(subdivision_option_tags, @options, @html_options)
        end
      end
    end
  end
end
