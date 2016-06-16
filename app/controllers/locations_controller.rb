module Api
  module V1
    class LocationsController < ApplicationController
      def index
        render json: Location.all, include: ['public_sector_special_pay_jobs']
      end
    end
  end
end
