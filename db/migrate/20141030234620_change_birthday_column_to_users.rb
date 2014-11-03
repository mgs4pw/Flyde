class ChangeBirthdayColumnToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :birthday

  	add_column :users, :birth_year, :integer
  end
end
