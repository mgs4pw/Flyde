class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	t.references :user

    	t.string :experiencest
    	t.date :date_from
    	t.date :date_to

    	t.timestamps
    end
  end
end
