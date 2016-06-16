class SkillSerializer < ActiveModel::Serializer
  attributes :id, :skill_coefficient, :name
  belongs_to :section
end
