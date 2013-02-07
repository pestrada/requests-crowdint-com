class SubmissionObserver < ActiveRecord::Observer
  observe VotingApp::Submission

  def after_create(submission)
    Notifier.new_request.deliver
  end

  def after_accept(submission, transition)
    Notifier.request_accepted.deliver
  end

  def after_complete(submission, transition)
    Notifier.request_completed.deliver
  end

  def after_promote(submission, transition)
    Notifier.request_promoted.deliver
  end

  def after_reject(submission, transition)
    Notifier.request_rejected.deliver
  end
end
