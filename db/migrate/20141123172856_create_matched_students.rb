class CreateMatchedStudents < ActiveRecord::Migration
  def change
    create_table :matched_students do |t|
      t.integer :company_id
      t.integer :student_id
      t.integer :position_id
      t.integer :matching_score
      t.integer :display_order
      t.integer :interview_sent
    end
  end
end
