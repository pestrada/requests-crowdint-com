class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted.page(1)
    @accepted  = Submission.accepted.page(1)
  end
end
