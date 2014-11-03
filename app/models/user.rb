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
end
