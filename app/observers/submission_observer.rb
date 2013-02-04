class SubmissionObserver < ActiveRecord::Observer
  def after_create(submission)
    Notifier.new_request.deliver
  end
end
