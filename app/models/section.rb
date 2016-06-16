class Section < ApplicationRecord
  has_many :private_sector_jobs
  has_many :skills
end
