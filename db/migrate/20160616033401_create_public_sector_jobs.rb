class CreatePublicSectorJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :public_sector_jobs do |t|
      t.integer :grade
      t.decimal :min
      t.decimal :max
    end
  end
end
