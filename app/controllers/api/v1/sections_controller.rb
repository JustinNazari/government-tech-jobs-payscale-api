module Api
  module V1
    class SectionsController < ApplicationController
      def index
        render json: Section.includes(:private_sector_jobs), include: ['private_sector_jobs']
      end

      def show
        section = Section.find(params[:id])
        jobs = section.all_jobs_chart_data
        render json: section
      end
    end
  end
end
