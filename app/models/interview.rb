class Interview < ActiveRecord::Base

  belongs_to :company, class_name: 'User', foreign_key: :company_id
  belongs_to :student, class_name: 'User', foreign_key: :student_id
  belongs_to :position

  SENT = 'SENT'
  ACCEPTED = 'ACCEPTED'
  DENIED = 'DENIED'

  scope :sent, -> { where('status = ?', 'SENT') }
  scope :scheduled, -> { where('status = ?', 'ACCEPTED') }
  scope :denied, -> { where('status = ?', 'DENIED') }

end