class AddDescriptionToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :description, :text
    add_column :interviews, :interview_datetime, :datetime
  end
end
