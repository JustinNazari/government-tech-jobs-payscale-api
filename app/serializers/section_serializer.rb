class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :private_sector_jobs
  has_many :skills
end
