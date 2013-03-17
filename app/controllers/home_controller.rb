class HomeController < ApplicationController
  def show
    @submitted = Request.submitted
    @promoted  = Request.promoted + Request.accepted
    @completed = Request.done.limit(30)
    @rejected = Request.rejected.limit(30)
  end
end
