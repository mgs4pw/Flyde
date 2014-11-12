class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
    	t.references :country
    	t.string :name
    end
  end
end
