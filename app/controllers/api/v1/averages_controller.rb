module Api
  module V1
    class AveragesController < ApplicationController
      def index
        render json: Average.all
      end
    end
  end
end
