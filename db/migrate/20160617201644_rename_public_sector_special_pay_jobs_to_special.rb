class RenamePublicSectorSpecialPayJobsToSpecial < ActiveRecord::Migration[5.0]
  def change
    rename_table :public_sector_special_pay_jobs, :special
  end
end
