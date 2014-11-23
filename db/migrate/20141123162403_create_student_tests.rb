class CreateStudentTests < ActiveRecord::Migration
  def change
    create_table :student_tests do |t|
      t.references :users
      t.references :skill_lists

      t.float :result

      t.timestamps
    end
  end
end
