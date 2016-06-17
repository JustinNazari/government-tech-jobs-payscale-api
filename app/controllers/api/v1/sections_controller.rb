module Api
  module V1
    class SectionsController < ApplicationController
      def index
        render json: Section.includes(:private_sector_jobs, :skills), include: ['private_sector_jobs', 'skills']
      end

      def show
        section = Section.find(params[:id])
        render json: section
      end
    end
  end
end
