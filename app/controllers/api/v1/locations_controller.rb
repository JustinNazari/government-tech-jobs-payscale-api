module Api
  module V1
    class LocationsController < ApplicationController
      def index
        render json: Location.includes(:public_sector_special_pay_jobs), include: ['public_sector_special_pay_jobs']
      end
    end
  end
end
