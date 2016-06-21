module Api
  module V1
    class LocationsController < ApplicationController
      def index
        render json: Location.includes(:public_sector_special_pay_jobs), include: ['public_sector_special_pay_jobs']
      end

      def show
        render json: Location.find(params[:id]).combined_public_salaries
      end
    end
  end
end
