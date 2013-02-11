class Notifier < ActionMailer::Base
  default from: 'requests@crowdint.com',
          to: %w(herman.moreno@crowdint.com ivan.calderon@crowdint.com gonzalo.fernandez@crowdint.com)

  def new_request
    mail(subject: 'New request')
  end

  def request_promoted
    mail(subject: 'Request promoted')
  end

  def request_accepted
    mail(subject: 'Request accepted')
  end

  def request_completed
    mail(subject: 'Request completed')
  end

  def request_rejected
    mail(subject: 'Request rejected')
  end

end
