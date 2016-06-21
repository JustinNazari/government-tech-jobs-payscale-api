class CreateAverages < ActiveRecord::Migration[5.0]
  def change
    create_table :averages do |t|
      t.decimal :private
      t.decimal :public
    end
  end
end
