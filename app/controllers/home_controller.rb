class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted
    @promoted  = Submission.processed
  end
end
