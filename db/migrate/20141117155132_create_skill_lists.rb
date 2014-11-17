class CreateSkillLists < ActiveRecord::Migration
  def change
    create_table :skill_lists do |t|
      t.string :name
    end
  end
end
