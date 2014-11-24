class Position < ActiveRecord::Base
  
  belongs_to :user

  belongs_to :skill_1, class_name: 'SkillList', foreign_key: :skill_1
  belongs_to :skill_2, class_name: 'SkillList', foreign_key: :skill_2
  belongs_to :skill_3, class_name: 'SkillList', foreign_key: :skill_3

  validates_presence_of :name

end