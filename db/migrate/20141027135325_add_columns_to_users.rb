class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :birthday, :date
  	add_column :users, :type, :boolean

  	add_reference :users, :country
  	add_reference :users, :province
  end
end
