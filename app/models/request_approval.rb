# model class  for RequestApproval
class RequestApproval < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :approver, class_name: 'User'
  belongs_to :requester, class_name: 'User'

  scope :to_be_approved, -> user { where "approver_id = ? AND approved_status = ?", user, 'NOT APPROVED' }

  def mark_as_approved
    self.approved_status = 'APPROVED'
    self.approved_at = Time.now
  end
  class << self
    def fetch_pending_requests
      where(approved_at: nil)
    end

    def request_daily_mails(requests)
      reuests_hash = requests.group_by(&:approver_id)
      reuests_hash.each do |_key, value|
        RequestMailer.request_pending(value).deliver_later
      end
    end
  end
end
