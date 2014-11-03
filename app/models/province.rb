class Province < ActiveRecord::Base
  
  belongs_to :country

  scope :get_by_country, lambda { |country_id| where('country_id = ?', country_id) }
end