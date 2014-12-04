class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :company_id
      t.integer :student_id
      t.integer :position_id
      t.datetime :sent_date
      t.string :status

      t.timestamps
    end
  end
end
