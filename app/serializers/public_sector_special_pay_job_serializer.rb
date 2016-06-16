class PublicSectorSpecialPayJobSerializer < ActiveModel::Serializer
  attributes :id, :grade, :min, :max, :supplement_coefficient
  belongs_to :location
end
