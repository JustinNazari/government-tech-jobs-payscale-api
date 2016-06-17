class RenamePublicSectorJobsToGeneral < ActiveRecord::Migration[5.0]
  def change
    rename_table :public_sector_jobs, :general
  end
end
