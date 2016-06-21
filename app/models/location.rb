class Location < ApplicationRecord
  has_many :public_sector_special_pay_jobs
  has_many :combined_public_salaries
end
