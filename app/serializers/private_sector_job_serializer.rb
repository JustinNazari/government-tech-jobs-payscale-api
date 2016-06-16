class PrivateSectorJobSerializer < ActiveModel::Serializer
  attributes :id, :title, :min, :max
  belongs_to :section
end
