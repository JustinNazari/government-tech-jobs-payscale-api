class PrivateSectorJob < ApplicationRecord
  belongs_to :section

  def self.allJobsBySection(section)
    chart_data = []
    jobs = section.private_sector_jobs
    jobs.each do |job|
      min_hash = {"group": job.title, "value": job.min, "label": "Minimum Salary"}
      max_hash = {"group": job.title, "value": job.max, "label": "Maximum Salary"}
      chart_data << min_hash
      chart_data << max_hash
    end
    chart_data
  end
end
