class Section < ApplicationRecord
  has_many :private_sector_jobs
  has_many :skills

  def all_jobs_chart_data
    chart_data = []
    self.private_sector_jobs.each do |job|
      min_hash = {"group": job.title, "value": job.min, "label": "Minimum Salary"}
      max_hash = {"group": job.title, "value": job.max, "label": "Maximum Salary"}
      chart_data << min_hash
      chart_data << max_hash
    end
    chart_data
  end
end
