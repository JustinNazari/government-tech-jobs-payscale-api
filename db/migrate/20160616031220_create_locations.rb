class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.decimal :gov_locality
      t.decimal :priv_locality
    end
  end
end
