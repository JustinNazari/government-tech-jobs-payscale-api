class CombinedPublicSalarySerializer < ActiveModel::Serializer
  attributes :id, :min, :max, :city, :state
  belongs_to :location
end
