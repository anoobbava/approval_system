class RequestApproval < ApplicationRecord
  validates_presence_of :name, :description

  scope :to_be_approved, -> user_id { where "approved_by = ? AND approved_status = ?" , user_id, 'NOT APPROVED'}

  def mark_as_approved
    self.approved_status = 'APPROVED'
    self.approved_at = Time.now
  end
end
