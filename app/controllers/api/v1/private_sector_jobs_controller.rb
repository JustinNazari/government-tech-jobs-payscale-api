module Api
  module V1
    class PrivateSectorJobsController < ApplicationController
      def index
        section = Section.find(params[:id])
        render json: PrivateSectorJob.allJobsBySection(section)
      end
    end
  end
end
