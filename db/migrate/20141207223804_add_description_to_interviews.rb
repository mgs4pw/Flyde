class AddDescriptionToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :description, :text
    add_column :interviews, :interview_datetime, :datetime
    add_column :interviews, :matching_score, :integer
  end
end
