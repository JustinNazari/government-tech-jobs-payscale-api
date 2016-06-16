module Api
  module V1
    class PrivateSectorJobsController < ApplicationController
      def index
        render json: PrivateSectorJob.includes(:section), include: ['section']
      end
    end
  end
end
