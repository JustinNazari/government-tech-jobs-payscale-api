module Api
  module V1
    class PublicSectorJobsController < ApplicationController
      def index
        render json: PublicSectorJob.all
      end
    end
  end
end
