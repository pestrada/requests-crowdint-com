class Notifier < ActionMailer::Base

  default from: 'Requests app <no-reply@crowdint.com>',
          to: ENV['EMAIL_LIST']

  def new_request(request)
    @request = request
    mail(subject: "New Request created by #{request.name}")
  end

  def request_promoted(request)
    @request = request
    mail(subject: "Promoted request, submitted by: #{request.name}")
  end

  def request_accepted(user, request)
    @user = user.name
    @request = request
    mail(subject: "#{request.name}'s request has been accepted")
  end

  def request_completed(request)
    @request = request
    mail(subject: "#{request.name}'s request has been completed")
  end

  def request_rejected(request)
    @request = request
    mail(subject: "#{request.name}'s request has been rejected")
  end

  def request_liked(request)
    puts 'request voted'
  end

  def request_commented(request)
    @request = request
    mail(to: "no-reply@crowdint.com", subject: "New comment on #{request.name}'s request",
        bcc: request.involved_users)
  end
end
