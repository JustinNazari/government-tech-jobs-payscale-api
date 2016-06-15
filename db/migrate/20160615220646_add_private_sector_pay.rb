class AddPrivateSectorPay < ActiveRecord::Migration[5.0]
  def change
    create_table :private_sector_pay do |t|
      t.string :title
      t.integer :min
      t.integer :max
    end
  end
end
