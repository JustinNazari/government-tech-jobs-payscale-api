class PublicSectorSpecialPayJobSerializer < ActiveModel::Serializer
  attributes :id, :grade, :min, :max, :supplement_coefficient
end
