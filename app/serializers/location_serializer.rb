class LocationSerializer < ActiveModel::Serializer
  attributes :id, :private_sector_coefficient, :public_sector_coefficient, :city, :state
  has_many :public_sector_special_pay_jobs
end
