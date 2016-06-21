class CombinedPublicSalarySerializer < ActiveModel::Serializer
  attributes :id, :grade, :min, :max, :city, :state
  belongs_to :location
end
