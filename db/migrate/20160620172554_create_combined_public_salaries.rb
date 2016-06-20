class CreateCombinedPublicSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :combined_public_salaries do |t|
      t.integer :grade
      t.decimal :min_base_pay
      t.decimal :min_supplement_coefficient
      t.decimal :max_base_pay
      t.decimal :max_supplement_coefficient
      t.belongs_to :location, foreign_key: true
    end
  end
end
