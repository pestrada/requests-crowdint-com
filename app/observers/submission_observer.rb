class SubmissionObserver < ActiveRecord::Observer
  observe VotingApp::Submission

  def after_create(submission)
    Notifier.new_request(submission).deliver
  end

  def after_accept(submission, transition)
    Notifier.request_accepted(submission).deliver
  end

  def after_complete(submission, transition)
    Notifier.request_completed(submission).deliver
  end

  def after_promote(submission, transition)
    Notifier.request_promoted(submission).deliver
  end

  def after_reject(submission, transition)
    Notifier.request_rejected(submission).deliver
  end
end
