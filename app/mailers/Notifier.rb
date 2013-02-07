class Notifier < ActionMailer::Base
  default from: 'requests@crowdint.com'

  def new_request
    mail(subject: 'New request', to: User.pluck(:email).compact)
  end

  def request_promoted
    mail(subject: 'Request promoted', to: User.pluck(:email).compact)
  end

  def request_accepted
    mail(subject: 'Request accepted', to: User.pluck(:email).compact)
  end

  def request_completed
    mail(subject: 'Request completed', to: User.pluck(:email).compact)
  end

  def request_rejected
    mail(subject: 'Request rejected', to: User.pluck(:email).compact)
  end

end
