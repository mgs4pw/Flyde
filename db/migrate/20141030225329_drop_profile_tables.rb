class DropProfileTables < ActiveRecord::Migration
  def change
  	drop_table :student_profiles
  	drop_table :company_profiles
  end
end
