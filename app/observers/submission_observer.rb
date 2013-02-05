class SubmissionObserver < ActiveRecord::Observer
  observe VotingApp::Submission

  def after_create(submission)
    EmailWorker.perform_async('new_request', 5)
  end
end
