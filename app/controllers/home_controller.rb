class HomeController < ApplicationController
  def show
    @submitted = Submission.submitted.page(1)
    @accepted  = Submission.promoted.page(1)
  end
end
