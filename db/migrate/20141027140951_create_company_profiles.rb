class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
    	t.references :user

    	t.string :website
    	t.text :description
    	t.string :position
    end
  end
end
