class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted.page(1)
    @promoted  = Submission.promoted.page(1)
  end
end
