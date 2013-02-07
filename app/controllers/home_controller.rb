class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted.page(1)
    @promoted  = Submission.processed.page(1)
  end
end
