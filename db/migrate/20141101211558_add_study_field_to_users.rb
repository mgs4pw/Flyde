class AddStudyFieldToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :study_field

    add_attachment :users, :photo
  end

  def self.up
    change_table :users do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :users, :photo
  end

end
