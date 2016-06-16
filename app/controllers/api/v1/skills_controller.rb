module Api
  module V1
    class SkillsController < ApplicationController
      def index
        render json: Skill.includes(:section), include: ['section']
      end
    end
  end
end
