module Api
  module V1
    class PublicSectorSpecialPayJobsController < ApplicationController
      def index
        render json: PublicSectorSpecialPayJob.all, include: ['location']
      end
    end
  end
end
