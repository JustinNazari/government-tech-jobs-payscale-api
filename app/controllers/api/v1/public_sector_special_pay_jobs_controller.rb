module Api
  module V1
    class PublicSectorSpecialPayJobsController < ApplicationController
      def index
        render json: PublicSectorSpecialPayJob.includes(:location), include: ['location']
      end
    end
  end
end
