class CreatePositionSkills < ActiveRecord::Migration
  def change
    create_table :position_skills do |t|
      t.references :positions

      t.string :skill
      t.integer :importance

      t.timestamps
    end
  end
end
