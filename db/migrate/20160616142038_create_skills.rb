class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :section_id
      t.decimal :skill_coefficient
      t.string :name
    end
  end
end
