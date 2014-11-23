class MatchedStudent < ActiveRecord::Base

  belongs_to :company, class_name: 'User', foreign_key: :company_id
  belongs_to :student, class_name: 'User', foreign_key: :student_id

  belongs_to :position

end