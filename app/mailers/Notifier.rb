class Notifier < ActionMailer::Base
  include Celluloid

  default from: 'requests@crowdint.com',
          to: ENV['EMAIL_LIST']

  def new_request(request)
    @request = request
    mail(subject: 'New request')
  end

  def request_promoted(request)
    @request = request
    mail(subject: 'Request promoted')
  end

  def request_accepted(request)
    @request = request
    mail(subject: 'Request accepted')
  end

  def request_completed(request)
    @request = request
    mail(subject: 'Request completed')
  end

  def request_rejected(request)
    @request = request
    mail(subject: 'Request rejected')
  end

end
