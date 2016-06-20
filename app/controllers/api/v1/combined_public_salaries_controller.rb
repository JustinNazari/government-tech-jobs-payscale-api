module Api
  module V1
    class CombinedPublicSalariesController < ApplicationController
      def index
        render json: CombinedPublicSalary.includes(:location), include: ['location']
      end
    end
  end
end
