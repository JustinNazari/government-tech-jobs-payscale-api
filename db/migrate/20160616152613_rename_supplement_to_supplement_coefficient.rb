class RenameSupplementToSupplementCoefficient < ActiveRecord::Migration[5.0]
  def change
    rename_column :public_sector_special_pay_jobs, :supplement, :supplement_coefficient
  end
end
