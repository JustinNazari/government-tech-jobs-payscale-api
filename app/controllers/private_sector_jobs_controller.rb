module Api
  module V1
    class PrivateSectorJobsController < ApplicationController
      def index
        render json: PrivateSectorJob.all, include: ['location', 'section']
      end
    end
  end
end
