class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :academic_status, :string
  	add_column :users, :study_field, :string
  	add_column :users, :school, :string
  	add_column :users, :major, :string
  	add_column :users, :position, :string
  	add_column :users, :company_name, :string
  	add_column :users, :website, :string
  	add_column :users, :description, :text
  end
end
