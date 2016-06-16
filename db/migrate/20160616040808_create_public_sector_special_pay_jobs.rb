class CreatePublicSectorSpecialPayJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :public_sector_special_pay_jobs do |t|
      t.integer :grade
      t.decimal :min
      t.decimal :max
      t.decimal :supplement
      t.belongs_to :location, foreign_key: true
    end
  end
end
