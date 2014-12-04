class User < ActiveRecord::Base
  
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  STUDENT  = 'student'
  COMPANY  = 'company'

  has_one :countries
  has_one :provinces
  has_one :study_fiels

  has_many :experiences
  has_many :skills
  has_many :positions
  has_many :student_tests

  has_many :matched_students, class_name: 'MatchedStudent', foreign_key: :company_id
  has_many :company_interviews, class_name: 'Interview', foreign_key: :company_id
  has_many :student_interviews, class_name: 'Interview', foreign_key: :student_id

  has_attached_file :photo,
                    :styles => {
                      :medium => "200x200>",
                      :thumb => "20x20>"
                    },
                    :default_url => "photo_medium.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
