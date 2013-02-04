class Notifier < ActionMailer::Base
  default from: 'requests@crowdint.com'

  def new_request
    mail(subject: 'New request')
  end

end
