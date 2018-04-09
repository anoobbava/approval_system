# here to send the mail daily basis
class DailyMail
  include Delayed::RecurringJob
  run_every 1.day
  run_at '02:00am'

  def perform
    approvals = RequestApproval.fetch_pending_requests
    return unless approvals
    RequestApproval.request_daily_mails(approvals)
  end
end
