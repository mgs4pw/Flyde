class StudentTest < ActiveRecord::Base

  belongs_to :user
  belongs_to :skill_list

  scope :by_student, lambda { |student_id| where('user_id = ?', student_id) }

end