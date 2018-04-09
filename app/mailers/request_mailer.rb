# this is the mail class for the request mailers.
class RequestMailer < ApplicationMailer
  def request_received(user, request)
    @user = user
    @request = request
    mail(to: @user.email, subject: 'Your Request received')
  end

  def request_pending(requests)
    @user = requests.first.approver
    @requests = requests
    mail(to: @user.email, subject: 'Request Pending')
  end
end
