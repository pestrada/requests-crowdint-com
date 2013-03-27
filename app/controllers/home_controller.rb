class HomeController < ApplicationController
  def show
    @submitted = Request.submitted
    @promoted  = Request.promoted + Request.accepted
    @completed = Request.done.in_last_month
    @rejected = Request.rejected.in_last_month + Request.timed_out.in_last_month
  end
end
