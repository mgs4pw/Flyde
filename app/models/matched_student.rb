class MatchedStudent < ActiveRecord::Base

  belongs_to :company, class_name: 'User', foreign_key: :company_id
  belongs_to :student, class_name: 'User', foreign_key: :student_id

  belongs_to :position

  default_scope -> { order(matching_score: :desc) }

  def self.interview_info(company_id, student_id, position_id)
    Interview.where(
        'company_id = ? and student_id = ? and position_id = ?',
        company_id,
        student_id,
        position_id
    ).first
  end

end