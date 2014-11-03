class CreateStudyFields < ActiveRecord::Migration
  def change
    create_table :study_fields do |t|
    	t.string :name
    end
  end
end
