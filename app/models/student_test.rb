class StudentTest < ActiveRecord::Base

  belongs_to :user
  belongs_to :skill_list

end