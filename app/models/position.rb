class Position < ActiveRecord::Base
  
  belongs_to :user

  has_many :matched_students
  has_many :interviews

  validates_presence_of :name

  def skill_1_name
    if self.skill_1.nil?
      ""
    else
      SkillList.find(self.skill_1).name
    end
  end

  def skill_2_name
    if self.skill_2.nil?
      ""
    else
      SkillList.find(self.skill_2).name
    end
  end

  def skill_3_name
    if self.skill_3.nil?
      ""
    else
      SkillList.find(self.skill_3).name
    end
  end

end