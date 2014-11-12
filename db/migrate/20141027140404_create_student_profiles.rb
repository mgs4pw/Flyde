class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
    	t.references :user

    	t.string :school
    	t.string :major
    	t.string :academic_status
    	t.string :study_field

    	t.timestamps
    end
  end
end
