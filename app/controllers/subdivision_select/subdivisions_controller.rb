module SubdivisionSelect
  class SubdivisionsController < ApplicationController
    def get
      render json: SubdivisionsHelper::get_subdivisions(params[:country_code], subdivision_option_params)
    end

    private

      def subdivision_option_params
        return {} if params[:option].nil?

        params.require(:option).permit(
          :translation
        )
      end
  end
end
