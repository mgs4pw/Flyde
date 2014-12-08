class AddSentDateToMatchedStudent < ActiveRecord::Migration
  def change
  	add_column :matched_students, :sent_date, :datetime
  	change_column :matched_students, :interview_sent, :string
  end
end
