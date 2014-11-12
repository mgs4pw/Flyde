class AddStudyFieldToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :study_field
  end
end
