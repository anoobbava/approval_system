# this is the mail class for the request mailers.
class RequestMailer < ApplicationMailer

  def request_received(user, request)
    @user = user
    @request = request
    mail(to: @user.email, subject: 'Your Request received')
  end
end
