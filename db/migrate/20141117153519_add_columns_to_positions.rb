class AddColumnsToPositions < ActiveRecord::Migration
  def change
  	add_column :positions, :skill_1, :string
  	add_column :positions, :importance_1, :integer

	add_column :positions, :skill_2, :string
  	add_column :positions, :importance_2, :integer

  	add_column :positions, :skill_3, :string
  	add_column :positions, :importance_3, :integer 
  end
end
