module Api
  module V1
    class SectionsController < ApplicationController
      def index
        render json: Section.includes(:private_sector_jobs), include: ['private_sector_jobs']
      end
    end
  end
end
