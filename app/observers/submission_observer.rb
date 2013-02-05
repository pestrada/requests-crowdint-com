class SubmissionObserver < ActiveRecord::Observer
  observe VotingApp::Submission

  def after_create(submission)
    Notifier.new_request.deliver
  end
end
