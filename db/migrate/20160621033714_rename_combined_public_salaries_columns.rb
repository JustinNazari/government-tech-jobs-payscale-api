class RenameCombinedPublicSalariesColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :combined_public_salaries, :min_base_pay, :min
    rename_column :combined_public_salaries, :max_base_pay, :max
    remove_column :combined_public_salaries, :min_supplement_coefficient
    remove_column :combined_public_salaries, :max_supplement_coefficient
    add_column :combined_public_salaries, :city, :string
    add_column :combined_public_salaries, :state, :string
  end
end
