class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted
    @accepted  = Submission.accepted
  end
end
