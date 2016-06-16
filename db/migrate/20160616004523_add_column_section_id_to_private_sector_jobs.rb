class AddColumnSectionIdToPrivateSectorJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :private_sector_jobs, :section_id, :integer
  end
end
