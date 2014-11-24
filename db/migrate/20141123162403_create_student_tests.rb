class CreateStudentTests < ActiveRecord::Migration
  def change
    create_table :student_tests do |t|
      t.references :user
      t.references :skill_list
      
      t.float :result

      t.timestamps
    end
  end
end
