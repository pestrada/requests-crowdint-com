class Notifier < ActionMailer::Base
  include Celluloid

  default from: 'Requests app <no-reply@crowdint.com>',
          to: ENV['EMAIL_LIST']

  def new_request(request)
    @request = request
    mail(subject: "Request created by #{request.user.name}")
  end

  def request_promoted(request)
    @request = request
    mail(subject: "'#{request.user.name}''s request has been promoted")
  end

  def request_accepted(request)
    @request = request
    mail(subject: "'#{request.user.name}''s request has been accepted")
  end

  def request_completed(request)
    @request = request
    mail(subject: "'#{request.user.name}''s request has been promoted")
  end

  def request_rejected(request)
    @request = request
    mail(subject: "'#{request.user.name}''s request has been rejected")
  end

end
