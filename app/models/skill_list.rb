class SkillList < ActiveRecord::Base

  has_many :student_tests 
  has_many :positions, class_name: 'Position', foreign_key: :skill_1
  
end