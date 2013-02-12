class SubmissionObserver < ActiveRecord::Observer
  observe VotingApp::Submission

  def notify_accepted(notification)
    Notifier.request_accepted(notification.submission).deliver
  end

  def notify_completed(notification)
    Notifier.request_completed(notification.submission).deliver
  end

  def notify_created(notification)
    Notifier.new_request(notification.submission).deliver
  end

  def notify_liked(notification)
  end

  def notify_promoted(notification)
    Notifier.request_promoted(notification.submission).deliver
  end

  def notify_rejected(notification)
    Notifier.request_rejected(notification.submission).deliver
  end
end
