class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :country
  	add_reference :users, :province

  	add_column :users, :phone_number, :string
  	add_column :users, :birthday, :date
  	add_column :users, :user_type, :string
  end
end
