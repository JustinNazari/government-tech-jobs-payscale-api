class CreateLocation < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :private_sector_coefficient
      t.decimal :public_sector_coefficient
      t.string :city
      t.string :state
    end
  end
end
